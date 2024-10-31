# Monitoramento e Execução do Codium em Container Docker

Este projeto fornece scripts para monitorar e gerenciar automaticamente a execução de um container Docker, garantindo que o processo codium esteja sempre ativo. Caso contrário, o script tenta parar o container. Inclui também um comando customizado para iniciar e executar o Codium diretamente do terminal com suporte para caminhos específicos.


## Descrição
- Script de monitoramento: Verifica se o container Docker giliover-codium e o processo codium estão em execução. Caso contrário, o container é interrompido.
- Script de execução: Inicia o container, se necessário, e executa o Codium com o caminho informado, facilitando o acesso direto pelo terminal.

Esses scripts são configurados para rodar periodicamente através do crontab.

## Pré-requisitos

- Docker instalado e configurado
- Container chamado giliover-codium com o Codium configurado
- Permissões adequadas para iniciar e parar containers

## Instalação
- Clone este repositório em sua máquina local:
```
git clone <URL_DO_REPOSITÓRIO>
cd <NOME_DIRETORIO>
```

- Mova o script codium-exec.sh para /usr/local/bin:
```
sudo cp codium.sh /usr/local/bin/codium
sudo chmod +x /usr/local/bin/codium
```
- Configure o caminho GILIOVER dentro do script para o caminho desejado.

## Configuração do Crontab
- Abra o crontab para edição:
```
crontab -e
```
- Adicione uma entrada para o monitoramento automático do container e do processo Codium. Por exemplo, para rodar o script a cada 5 minutos:
```
*/5 * * * * /caminho/para/seu/script/monitor-codium.sh >> /var/log/monitor-codium.log 2>&1
```

## Uso
Para rodar o Codium com um caminho específico, basta usar o comando customizado:
```
codium /caminho/para/seu/arquivo
```

- Este comando:
    - Substitui o placeholder $GILIOVER no caminho
    - Inicia o container, se necessário
    - Executa o Codium diretamente com o caminho informado

## Contribuição
Contribuições são bem-vindas! Para contribuir, faça um fork deste repositório, crie um branch para suas modificações e abra um pull request.