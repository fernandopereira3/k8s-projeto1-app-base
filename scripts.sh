#!/bin/bash/

echo -e "Criando as imagens Docker..."

docker build -t fernandopereira3/backend:0.1 backends/.
docker build -t fernandopereira3/database:0.1 database/.

sleep 5
clear

echo -e "Push nos containerrs..."

docker push fernandopereira3/backend:0.1
docker push fernandopereira3/database:0.1

sleep 5
clear

echo "Criando Servicos..."

kubectl apply -f services.yml --validate=false

sleep 5
clear

echo "Fazendo Deployments..."

kubectl apply -f deployment.yml

clear
echo "Comando executados com sucesso!"