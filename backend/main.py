import hashlib
import hmac
import logging
import time
from collections import defaultdict
from contextlib import asynccontextmanager
from pathlib import Path

from dotenv import load_dotenv

# Load env vars before importing anything that reads Langfuse/Ollama config
# at call time (routers -> agents -> base.get_langfuse_client/get_ollama_client).
load_dotenv(Path(__file__).parent.parent / ".env.local")

from fastapi import FastAPI, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from .agents.base import get_langfuse_client
from .db import get_supabase
from .routers.agents import router as agents_router
from .routers.simulate import router as simulate_router
from .scheduler import start_scheduler, stop_scheduler

logging.basicConfig(level=logging.INFO)


@asynccontextmanager
async def lifespan(_app: FastAPI):
    start_scheduler()
    try:
        yield
    finally:
        stop_scheduler()
        # Flush buffered Langfuse traces before the process exits.
        langfuse = get_langfuse_client()
        if langfuse is not None:
            try:
                langfuse.shutdown()
            except Exception:
                pass


app = FastAPI(title="TruCart API", version="0.0.1", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(agents_router)
app.include_router(simulate_router)


class LoginRequest(BaseModel):
    email: str
    password: str


class ChangePasswordRequest(BaseModel):
    user_id: str
    current_password: str
    new_password: str


# Simple in-memory login throttle: max attempts per (email, ip) per window.
_LOGIN_WINDOW_S = 900
_LOGIN_MAX_ATTEMPTS = 5
_login_attempts: dict[str, list[float]] = defaultdict(list)


def _is_rate_limited(key: str) -> bool:
    now = time.time()
    recent = [t for t in _login_attempts[key] if now - t < _LOGIN_WINDOW_S]
    _login_attempts[key] = recent
    return len(recent) >= _LOGIN_MAX_ATTEMPTS


def hash_password(password: str) -> str:
    """Produce a bcrypt hash (cost 10) matching the seed data's scheme."""
    import bcrypt

    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt(rounds=10)).decode("utf-8")


def verify_password(password: str, stored_hash: str) -> bool:
    if not stored_hash:
        return False
    if len(stored_hash) == 40:  # SHA1 hex digest
        return hmac.compare_digest(
            hashlib.sha1(password.encode("utf-8")).hexdigest(), stored_hash.lower()
        )
    if stored_hash.startswith("$2"):  # bcrypt
        try:
            import bcrypt

            return bcrypt.checkpw(password.encode("utf-8"), stored_hash.encode("utf-8"))
        except Exception:
            return False
    # No plaintext or unknown-scheme fallback: an unrecognised hash never matches.
    return False


@app.get("/")
def root():
    return {"message": "TruCart API is running"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/api/auth/login")
def login(body: LoginRequest, request: Request):
    email = body.email.strip().lower()
    client_ip = request.client.host if request.client else "unknown"
    throttle_key = f"{email}|{client_ip}"

    if _is_rate_limited(throttle_key):
        raise HTTPException(status_code=429, detail="Too many attempts. Try again in a few minutes.")

    result = (
        get_supabase()
        .table("users")
        .select("*")
        .eq("email", email)
        .maybe_single()
        .execute()
    )
    user = result.data
    if not user or not verify_password(body.password, user.get("password_hash") or ""):
        _login_attempts[throttle_key].append(time.time())
        raise HTTPException(status_code=401, detail="Invalid credentials")
    if not user.get("is_active", True):
        raise HTTPException(status_code=403, detail="Account disabled")

    _login_attempts.pop(throttle_key, None)
    return {
        "status": "success",
        "user": {
            "id": user["user_id"],
            "email": user["email"],
            "full_name": user["full_name"],
            "role": user["role"],
        },
    }


@app.post("/api/auth/change-password")
def change_password(body: ChangePasswordRequest):
    if len(body.new_password) < 8:
        raise HTTPException(status_code=400, detail="New password must be at least 8 characters.")

    result = (
        get_supabase()
        .table("users")
        .select("*")
        .eq("user_id", body.user_id)
        .maybe_single()
        .execute()
    )
    user = result.data
    if not user or not verify_password(body.current_password, user.get("password_hash") or ""):
        raise HTTPException(status_code=401, detail="Current password is incorrect.")
    if not user.get("is_active", True):
        raise HTTPException(status_code=403, detail="Account disabled")

    get_supabase().table("users").update(
        {"password_hash": hash_password(body.new_password)}
    ).eq("user_id", body.user_id).execute()
    return {"status": "success"}
