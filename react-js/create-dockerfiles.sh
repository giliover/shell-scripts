#!/bin/bash

# Verifica se o nome do projeto foi fornecido
if [ -z "$1" ]; then
  echo "Uso: ./create-dockerfiles.sh <nome-do-projeto>"
  exit 1
fi

PROJECT_NAME=$1

# Cria o Dockerfile para desenvolvimento
echo "Criando Dockerfile para desenvolvimento..."
cat <<EOF > $PROJECT_NAME/Dockerfile
# Usar imagem oficial do Node.js mais atual
FROM node:current-alpine

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar o package.json e o package-lock.json para o contêiner
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante dos arquivos do projeto
COPY . .

# Expor a porta da aplicação
EXPOSE 3000

# Comando padrão para rodar o app
CMD ["npm", "start"]
EOF

# Cria o docker-compose.yml
echo "Criando docker-compose.yml..."
cat <<EOF > $PROJECT_NAME/docker-compose.yml
version: "3"
services:
  $PROJECT_NAME:
    container_name: $PROJECT_NAME
    image: $PROJECT_NAME
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - CHOKIDAR_USEPOLLING=true
EOF
