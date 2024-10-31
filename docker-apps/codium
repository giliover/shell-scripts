#!/bin/bash

# Nome do container
CONTAINER_NAME="giliover-codium"

# Substitui $GILIOVER pelo caminho desejado
new_path="${1/$GILIOVER/\/home\/ubuntu}"

# Verifica se o container está rodando; se não, o inicia
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Container $CONTAINER_NAME não está em execução. Iniciando o container..."
    docker start "$CONTAINER_NAME"
    
    # Verifica se o container foi iniciado com sucesso
    if [ $? -ne 0 ]; then
        echo "Erro: Não foi possível iniciar o container $CONTAINER_NAME."
        exit 1
    fi
fi

# Executa o comando no container
echo "Executando o codium no container com o caminho: $new_path"
docker exec -it "$CONTAINER_NAME" codium "$new_path"

