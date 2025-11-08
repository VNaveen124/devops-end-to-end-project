import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [users, setUsers] = useState([]);
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch('/api/users')
      .then(response => response.json())
      .then(data => setUsers(data));

    fetch('/api/products')
      .then(response => response.json())
      .then(data => setProducts(data));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>Welcome to the 3-Tier Web App</h1>
      </header>
      <div className="container">
        <div className="section">
          <h2>Users</h2>
          <ul>
            {users.map(user => (
              <li key={user.id}>{user.name} ({user.email})</li>
            ))}
          </ul>
        </div>
        <div className="section">
          <h2>Products</h2>
          <ul>
            {products.map(product => (
              <li key={product.id}>{product.name} - ${product.price}</li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
}

export default App;
