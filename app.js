const express = require('express');
const app = express();

app.use(express.json());

// Endpoint de health check — OBLIGATORIO para el pipeline
// app.get('/health', (req, res) => {
//   res.status(200).json({ 
//     status: 'ok', 
//     version: '2.0.0',           // ← Cambio visible
//     timestamp: new Date().toISOString()
//   });
// });

// Endpoint raíz
app.get('/', (req, res) => {
  res.json({ message: 'API funcionando correctamente 🚀' });
});

// Endpoint de ejemplo
app.get('/api/items', (req, res) => {
  res.json([
    { id: 1, nombre: 'Item uno' },
    { id: 2, nombre: 'Item dos' },
  ]);
});

module.exports = app;
