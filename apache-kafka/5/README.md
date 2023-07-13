# Configure Kafka Security

```bash
$ mkdir -p zookeeper/data
$ mkdir -p kafka/data
$ chown -R 1001:1001 zookeeper
$ sudo chown -R 1001:1001 kafka
$ docker-compose up -d
```

Enter Kafka Container and execute following

```bash
$ docker-compose exec kafka bash
```

Check jass configuraiton file

```bash
$ cat /opt/bitnami/kafka/config/kafka_jaas.conf
KafkaClient {
   org.apache.kafka.common.security.plain.PlainLoginModule required
   username="user"
   password="bitnami";
   };
KafkaServer {
   org.apache.kafka.common.security.plain.PlainLoginModule required
   username="interbrokeruser"
   password="interbrokerpass"
   user_interbrokeruser="interbrokerpass"
   user_user="bitnami";
   org.apache.kafka.common.security.scram.ScramLoginModule required;
   };
Client {
   org.apache.kafka.common.security.plain.PlainLoginModule required
   username="zookeeper"
   password="zkpass";
   };

```

For Kafka Producer

```bash
#Copy the producer file
$ cp /opt/bitnami/kafka/config/producer.properties  /opt/bitnami/kafka/config/producer_sasl.properties

#Add the SASL properties
$ echo "sasl.mechanism=PLAIN
security.protocol=SASL_PLAINTEXT" >> /opt/bitnami/kafka/config/producer_sasl.properties

#Run the producer script
$ export KAFKA_OPTS="-Djava.security.auth.login.config=/opt/bitnami/kafka/config/kafka_jaas.conf"
$ kafka-console-producer.sh --bootstrap-server kafka.com:9092 --topic test --producer.config /opt/bitnami/kafka/config/producer_sasl.properties
```

For Kafka Consumer

```bash
#Copy the consumer file
$ cp /opt/bitnami/kafka/config/consumer.properties /opt/bitnami/kafka/config/consumer_sasl.properties

#Add the SASL properties
$ echo "sasl.mechanism=PLAIN
security.protocol=SASL_PLAINTEXT" >> /opt/bitnami/kafka/config/consumer_sasl.properties

#Run the producer script
$ export KAFKA_OPTS="-Djava.security.auth.login.config=/opt/bitnami/kafka/config/kafka_jaas.conf"
$ kafka-console-consumer.sh --bootstrap-server kafka.com:9092 --topic test --from-beginning --consumer.config /opt/bitnami/kafka/config/consumer_sasl.properties
```
