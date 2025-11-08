from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class User(BaseModel):
    id: int
    name: str
    email: str


class Product(BaseModel):
    id: int
    name: str
    price: float


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/users")
def get_users():
    return [{"id": 1, "name": "John Doe", "email": "john.doe@example.com"}]


@app.get("/products")
def get_products():
    return [{"id": 1, "name": "Laptop", "price": 1200.00}]
