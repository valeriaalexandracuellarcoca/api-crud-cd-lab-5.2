# 🐳 API CRUD — Lab 5.2: Pipeline de Despliegue Continuo

API REST construida con Node.js y Express, desplegada automáticamente mediante un pipeline de CD con Docker y GitHub Actions.

## 🚀 Tecnologías

- **Runtime:** Node.js 20 (Alpine)
- **Framework:** Express 4.x
- **Contenedorización:** Docker (multi-stage build)
- **CI/CD:** GitHub Actions
- **Registro de imágenes:** Docker Hub
- **Servidor de producción:** AWS EC2 (Ubuntu)
- **Seguridad:** Trivy (escaneo de vulnerabilidades)

## 📦 Endpoints

| Método | Ruta | Descripción |
|---|---|---|
| GET | `/` | Mensaje de bienvenida |
| GET | `/health` | Health check (usado por el pipeline) |
| GET | `/api/items` | Lista de items de ejemplo |

## 🔄 Pipeline de CD

El pipeline se ejecuta automáticamente en cada push a `main`:

```
Push → Build imagen Docker → Push a Docker Hub → Escaneo Trivy → Deploy a EC2 (con health check)
```

## 🏃 Ejecución local

```bash
# Instalar dependencias
npm install

# Ejecutar
node server.js

# Probar
curl http://localhost:3000/health
```

## 🐳 Docker local

```bash
# Construir imagen
docker build -t mi-app:local .

# Ejecutar contenedor
docker run -d -p 3000:3000 --name app-local mi-app:local

# Probar
curl http://localhost:3000/health

# Limpiar
docker stop app-local && docker rm app-local
```

## 📋 Documentación del Laboratorio

Puedes encontrar el informe completo con capturas de pantalla y evidencias en el siguiente enlace:

- [Ver informe del laboratorio](./INFORME.md)