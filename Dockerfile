# =============================================
# Etapa 1: Builder
# Instala dependencias y prepara los artefactos
# =============================================
FROM node:20-alpine AS builder

WORKDIR /app

# Copiar manifiestos primero (aprovechar caché de Docker)
COPY package*.json ./

# Instalar SOLO dependencias de producción
RUN npm ci --only=production

# Copiar código fuente
COPY . .

# =============================================
# Etapa 2: Runtime
# Imagen final mínima — sin herramientas de build
# =============================================
FROM node:20-alpine

# Buena práctica: no correr como root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copiar solo lo necesario desde el builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/app.js ./
COPY --from=builder /app/server.js ./

# Cambiar al usuario no-root
USER appuser

# Puerto que expone la app
EXPOSE 3000

# Comando de arranque
CMD ["node", "server.js"]
