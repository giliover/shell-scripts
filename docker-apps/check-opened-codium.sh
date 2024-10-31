#!/bin/bash

# Nome do container
CONTAINER_NAME="giliover-codium"

if docker ps | grep -q "$CONTAINER_NAME"; then
    echo "Container $CONTAINER_NAME está ativo."
    
    if docker exec "$CONTAINER_NAME" pgrep -x "codium" > /dev/null; then
        echo "Processo do codium está rodando no container $CONTAINER_NAME."
    else
        echo "Processo do codium não está rodando no container $CONTAINER_NAME. Tentando parar o container..."
        
        docker stop "$CONTAINER_NAME"
        
        if docker ps | grep -q "$CONTAINER_NAME"; then
            echo "Falha ao parar o container $CONTAINER_NAME."
        else
            echo "Container $CONTAINER_NAME parado com sucesso."
        fi
    fi
else
    echo "Container $CONTAINER_NAME não está ativo."
fi

