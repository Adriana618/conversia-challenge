from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_send_sms():
    response = client.get("/api/v1/send-sms/test-id/helloworld")
    assert response.status_code == 200