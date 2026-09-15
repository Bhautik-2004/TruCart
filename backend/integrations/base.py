class IntegrationNotConfigured(Exception):
    """Raised when a provider's required env vars are missing. Carries the
    exact var names so the API/frontend can tell the operator what to add to
    .env.local instead of silently no-op'ing the feature."""

    def __init__(self, provider: str, missing_env: list[str]):
        self.provider = provider
        self.missing_env = missing_env
        super().__init__(
            f"{provider} is not configured. Add {', '.join(missing_env)} to .env.local to enable it."
        )
