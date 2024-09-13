#!/bin/bash

# Verifica se o nome do projeto foi fornecido
if [ -z "$1" ]; then
  echo "Uso: ./create-react-project.sh <nome-do-projeto>"
  exit 1
fi


PROJECT_NAME=$(echo "$1" | awk -F',' '{print $1}')

LANGUAGE=$(echo "$1" | awk -F',' '{print $2}')

# Cria o projeto React no diretório atual
echo "Criando o projeto React no diretório $PROJECT_NAME..."
case $LANGUAGE in
  'ts')
   docker run --rm -v $(pwd):/app -w /app node:current-alpine sh -c "apk add git && npx create-react-app $PROJECT_NAME --template typescript"
    ;;
  "js")
   docker run --rm -v $(pwd):/app -w /app node:current-alpine sh -c "apk add git && npx create-react-app $PROJECT_NAME"
    ;;
  *)
    echo "Opção Inválida!"
    ;;
esac
