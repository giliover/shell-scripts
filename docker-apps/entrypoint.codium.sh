#!/bin/bash

codium &

SHUTDOWN_FILE="/shutdown"

echo "Container rodando. Crie o arquivo /shutdown para encerrar."

while true; do
  if [ -f "$SHUTDOWN_FILE" ]; then
    echo "Arquivo de shutdown detectado. Encerrando o container..."
    exit 0
  fi
  sleep 1
done
