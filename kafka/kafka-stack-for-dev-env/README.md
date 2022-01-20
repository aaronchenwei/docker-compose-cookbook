# Stack Version

- Zookeeper version: 3.5.9
- Kafka version: 2.8.0 (Confluent 6.2.1)

# FAQ

## Kafka

Q: Kafka's log is too verbose, how can I reduce it?

A: Add the following line to your docker-compose environment variables: `KAFKA_LOG4J_LOGGERS: "kafka.controller=INFO,kafka.producer.async.DefaultEventHandler=INFO,state.change.logger=INFO"`. Full logging control can be accessed here: https://github.com/confluentinc/cp-docker-images/blob/master/debian/kafka/include/etc/confluent/docker/log4j.properties.template
