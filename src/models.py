from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, HttpUrl


class Integration(BaseModel):
    id: UUID
    name: str
    description: str
    endpoint: HttpUrl
    created: datetime
    updated: datetime
    access_token: str