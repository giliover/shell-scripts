#!/bin/bash

json_file="/users.json"

menu=$(grep -o '"displayName": *"[^"]*"\|"login": *"[^"]*"' "$json_file" | sed -e 's/"displayName": "\(.*\)"/\1/' -e 's/"login": "\(.*\)"/\1/' | awk 'NR%2{printf "%s=", $0; next}1')

options=($(echo "$menu" | awk -F= '{print $1}'))

check_user_status() {
    local login="$1"
    local response=$(curl -s "https://www.twitch.tv/$login")
    

    if echo "$response" | grep -q '"isLiveBroadcast":true'; then
        echo "online"
    else
        echo "offline"
    fi
}

echo "Escolha uma opção:"
for i in "${!options[@]}"; do
    login=$(echo "$menu" | grep "${options[$i]}" | awk -F= '{print $2}')

    echo "$i) ${options[$i]}"
done

read -p "Digite o número da opção: " choice

if [[ $choice -ge 0 && $choice -lt ${#options[@]} ]]; then
    selected_option=${options[$choice]}
    login=$(echo "$menu" | grep "$selected_option" | awk -F= '{print $2}')
    echo "Você escolheu: $selected_option (login: $login)"
    streamlink https://www.twitch.tv/$login 480p -p vlc
else
    echo "Escolha inválida."
fi

tail -f /dev/null
