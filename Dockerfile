FROM node:18-alpine

# No utilizar root
USER node

# Crear carpeta app
WORKDIR /app

# Copiar package.json y dependencias
COPY --chown=node:node package*.json ./

RUN npm ci

# Copiar el código
COPY --chown=node:node . .

EXPOSE 3000

CMD ["npm", "start"]
