#!/bin/bash

# Verifica se o Zookeeper está disponível (ajuste o comando conforme necessário)
until nc -z zookeeper 2181; do
  echo "Esperando pelo Zookeeper..."
  sleep 2
done

# Executa o script run-kafka.sh
echo "Executando o script run-kafka.sh"
/run-kafka.sh

# Executa o comando padrão do Kafka (ajustar conforme necessário)
exec "$@"