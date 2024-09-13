#!/bin/bash

# Verifica se o nome do projeto foi fornecido
if [ -z "$1" ]; then
  echo "Uso: ./create-react-project.sh <nome-do-projeto>"
  exit 1
fi

PROJECT_NAME=$1

# Cria o diretório do projeto e entra nele
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Cria o projeto React no diretório atual
echo "Criando o projeto React no diretório $PROJECT_NAME..."
docker run --rm -v $(pwd):/app -w /app node:current-alpine npx create-react-app .
