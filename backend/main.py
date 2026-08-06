import hashlib
import hmac
from pathlib import Path

from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from .db import get_supabase

load_dotenv(Path(__file__).parent.parent / ".env.local")

app = FastAPI(title="TruCart API", version="0.0.1")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class LoginRequest(BaseModel):
    email: str
    password: str


def verify_password(password: str, stored_hash: str) -> bool:
    if not stored_hash:
        return False
    if len(stored_hash) == 40:  # SHA1 hex digest
        return hashlib.sha1(password.encode("utf-8")).hexdigest() == stored_hash.lower()
    if stored_hash.startswith("$2"):  # bcrypt
        try:
            import bcrypt

            return bcrypt.checkpw(password.encode("utf-8"), stored_hash.encode("utf-8"))
        except Exception:
            return False
    return hmac.compare_digest(password, stored_hash)


@app.get("/")
def root():
    return {"message": "TruCart API is running"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/api/auth/login")
def login(body: LoginRequest):
    email = body.email.strip().lower()
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
        raise HTTPException(status_code=401, detail="Invalid credentials")
    if not user.get("is_active", True):
        raise HTTPException(status_code=403, detail="Account disabled")
    return {
        "status": "success",
        "user": {
            "id": user["user_id"],
            "email": user["email"],
            "full_name": user["full_name"],
            "role": user["role"],
        },
    }
