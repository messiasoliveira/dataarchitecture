# dataarchitecture

docker build -t dataarchitecture -f LOCALPATH\dataarchitecture\docker-compose.yaml .
ou
docker compose up

Para executar o docker:
-----
docker exec -it CONTAINER_ID bash

Acesse o kafka container
-----
cd bin & kafka-topics.sh --list --bootstrap-server 172.25.0.12:9092

Irá listar o tópico criado chamada yfinance-data
