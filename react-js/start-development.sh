#!/bin/bash

# Verifica se o nome do projeto foi fornecido
if [ -z "$1" ]; then
  echo "Uso: ./start-development.sh <nome-do-projeto>"
  exit 1
fi

PROJECT_NAME=$1

# Entra no diretório do projeto
cd $PROJECT_NAME

# Inicia o ambiente de desenvolvimento com Docker Compose
echo "Iniciando o ambiente de desenvolvimento com Docker Compose..."
docker-compose up -d

# Abre o projeto no navegador
echo "Abrindo o projeto em http://localhost:3000..."
xdg-open http://localhost:3000 &>/dev/null || open http://localhost:3000 &>/dev/null

echo "Seu projeto React com Docker está rodando!"
