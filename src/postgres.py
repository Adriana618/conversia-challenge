import os
from collections.abc import Callable

from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine

DATABASE_URL = os.getenv("DATABASE_URL", "postgresql+psycopg://postgres:postgres@localhost/conversia")

_engine = create_async_engine(DATABASE_URL, echo=False)

Session: Callable[[], AsyncSession] = async_sessionmaker(_engine)