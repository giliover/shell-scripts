#!/bin/bash

# Define a porcentagem desejada na variável de ambiente
PORCENTAGEM_NOTIFICACAO=20

# Obtém a porcentagem da bateria
PORCENTAGEM_BATERIA=$(cat /sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/capacity)

notify-send $PORCENTAGEM_BATERIA

# Verifica se a porcentagem da bateria é menor ou igual à porcentagem definida
if [ "$PORCENTAGEM_BATERIA" -le "$PORCENTAGEM_NOTIFICACAO" ]; then
    notify-send "Bateria baixa" "A bateria está em $PORCENTAGEM_BATERIA%. Por favor, conecte o carregador."
fi

