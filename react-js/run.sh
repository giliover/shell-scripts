#!/bin/bash

# Verifica se o nome do projeto foi fornecido
if [ -z "$1" ]; then
  echo "Uso: ./create-react-project.sh <nome-do-projeto>"
  exit 1
fi

PROJECT_NAME=$1

./create-react-project.sh $PROJECT_NAME 
./create-dockerfiles.sh $PROJECT_NAME
./start-development.sh $PROJECT_NAME
