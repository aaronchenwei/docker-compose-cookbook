
from https://github.com/conduktor/kafka-stack-docker-compose

# Stack Version

- Zookeeper version: 3.6.3
- Kafka version: 3.2.x (Confluent 7.2.x)

# FAQ

## Kafka

Q: Kafka's log is too verbose, how can I reduce it?

A: Add the following line to your docker-compose environment variables: `KAFKA_LOG4J_LOGGERS: "kafka.controller=INFO,kafka.producer.async.DefaultEventHandler=INFO,state.change.logger=INFO"`. Full logging control can be accessed here: https://github.com/confluentinc/cp-docker-images/blob/master/debian/kafka/include/etc/confluent/docker/log4j.properties.template
