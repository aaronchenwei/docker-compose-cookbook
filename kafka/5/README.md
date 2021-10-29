# Configure Kafka Security

```bash
$ docker-compose up -d
```

Enter Kafka Container and execute following

```bash
$ docker-compose exec kafka bash
```

For Kafka Producer

```bash
#Copy the producer file
cp /opt/bitnami/kafka/config/producer.properties  /opt/bitnami/kafka/config/producer_sasl.properties

#Add the SASL properties
echo "sasl.mechanism=PLAIN
security.protocol=SASL_PLAINTEXT" >> /opt/bitnami/kafka/config/producer_sasl.properties

#Run the producer script
export KAFKA_OPTS="-Djava.security.auth.login.config=/opt/bitnami/kafka/config/kafka_jaas.conf"
kafka-console-producer.sh --bootstrap-server kafka.com:9092 --topic test --producer.config /opt/bitnami/kafka/config/producer_sasl.properties
```

For Kafka Consumer

```bash
#Copy the consumer file
cp /opt/bitnami/kafka/config/consumer.properties /opt/bitnami/kafka/config/consumer_sasl.properties
#Add the SASL properties
echo "sasl.mechanism=PLAIN
security.protocol=SASL_PLAINTEXT" >> /opt/bitnami/kafka/config/consumer_sasl.properties

#Run the producer script
export KAFKA_OPTS="-Djava.security.auth.login.config=/opt/bitnami/kafka/config/kafka_jaas.conf"
kafka-console-consumer.sh --bootstrap-server kafka.com:9092 --topic test --from-beginning --consumer.config /opt/bitnami/kafka/config/consumer_sasl.properties
```
