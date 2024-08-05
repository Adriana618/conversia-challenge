from typing import Annotated

from fastapi import FastAPI, Header
from .postgres import Session
from sqlalchemy import text
from .models import Integration
import httpx
import os

app = FastAPI()

TOKEN = os.getenv("TOKEN", "helloworld")



@app.get("/api/v1/send-sms/{integration_id}/{token}")
async def send_sms_twilio(integration_id: str, token: str):
    if token == TOKEN:
        try:
            query = "SELECT * FROM integrations WHERE id = '{}'".format(integration_id)
            db = Session()
            result = await db.execute(text(query))
            rows = result.first()
            integration = Integration(
                id=rows[0],
                name=rows[1],
                description=rows[2],
                endpoint=rows[3],
                created=rows[4],
                updated=rows[5],
                access_token=rows[6],
            )

            # Perform the request to the Twilio API

            async with httpx.AsyncClient() as client:
                response = await client.post(
                    integration.endpoint,
                    headers={"Authorization": f"Bearer {integration.access_token}"},
                    json={"message": "Hello, World!"},
                )
                return {"response": response.json()}
        except Exception as e:
            print(e)

        return {"response": "Error"}