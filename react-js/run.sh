#!/bin/bash

# Função para criar um projeto React
create_react_project() {
  echo "Informe o nome do projeto React:"
  read PROJECT_NAME
  ./create-react-project.sh $PROJECT_NAME
}

# Função para criar os arquivos Docker (Dockerfile e docker-compose.yml)
setup_docker() {
  echo "Informe o nome do projeto React:"
  read PROJECT_NAME
  ./create-dockerfiles.sh $PROJECT_NAME
}

# Função para iniciar o ambiente de desenvolvimento Docker
start_docker() {
  echo "Informe o nome do projeto React:"
  read PROJECT_NAME
  ./start-development.sh $PROJECT_NAME
}

# Função para parar os contêineres
stop_docker() {
  echo "Parando os contêineres Docker..."
  docker-compose down
}

# Função para exibir o menu
show_menu() {
  clear
  echo "=============================="
  echo "         MENU PRINCIPAL       "
  echo "=============================="
  echo "1. Criar, configurar e iniciar um novo projeto React(TS)"
  echo "2. Criar, configurar e iniciar um novo projeto React(JS)"
  echo "3. Criar um novo projeto React(TS)"
  echo "4. Criar um novo projeto React(JS)"
  echo "5. Configurar Docker para o projeto"
  echo "6. Iniciar ambiente de desenvolvimento Docker"
  echo "7. Parar os contêineres Docker"
  echo "8. Sair"
  echo "=============================="
  echo "Escolha uma opção:"
}

create_setup_start(){
  echo "Informe o nome do projeto React:"
  read PROJECT_NAME
  ./create-react-project.sh $PROJECT_NAME,$1 
  ./create-dockerfiles.sh $PROJECT_NAME
  ./start-development.sh $PROJECT_NAME
  exit 0
}


# Função principal para o loop do menu
main_menu() {
  while true; do
    show_menu
    read OPTION
    case $OPTION in
      1)
        create_setup_start ts
        ;;
      2)
        create_setup_start js
        ;;
      3)
        setup_docker ts
        ;;
      4)
        setup_docker js
        ;;
      5)
        start_docker
        ;;
      6)
        stop_docker
        ;;
      7)
        create_react_project
      ;;
      8)
        echo "Saindo do menu..."
        exit 0
        ;;
      *)
        echo "Opção inválida. Por favor, escolha novamente."
        ;;
    esac
    echo "Pressione qualquer tecla para continuar..."
    read -n 1
  done
}

# Inicia o menu principal
main_menu
