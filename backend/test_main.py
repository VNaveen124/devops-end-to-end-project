from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}


def test_get_users():
    response = client.get("/users")
    assert response.status_code == 200
    assert response.json() == [{"id": 1, "name": "John Doe", "email": "john.doe@example.com"}]


def test_get_products():
    response = client.get("/products")
    assert response.status_code == 200
    assert response.json() == [{"id": 1, "name": "Laptop", "price": 1200.00}]
