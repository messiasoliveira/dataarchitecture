kafka-topics --create --topic yfinance-data --bootstrap-server 172.25.0.12:9092 --partitions 1 --replication-factor 1
kafka-console-producer --topic yfinance-data --bootstrap-server 172.25.0.12:9092
kafka-console-consumer --topic yfinance-data --bootstrap-server 172.25.0.12:9092 --group yfinance --from-offset

#!/bin/sh
echo "Start: Sleep 15 seconds"
sleep 30;
wait;
echo "Begin creating topics"
docker exec Kafka1 kafka-topics --create --if-not-exists --topic yfinance-data --bootstrap-server 172.25.0.12:9092 --partitions 1 --replication-factor 1
docker exec Kafka1 kafka-console-producer --topic yfinance-data --bootstrap-server 172.25.0.12:9092
docker exec Kafka1 kafka-console-consumer --topic yfinance-data --bootstrap-server 172.25.0.12:9092 --group yfinance --from-offset
echo "Done creating topics"