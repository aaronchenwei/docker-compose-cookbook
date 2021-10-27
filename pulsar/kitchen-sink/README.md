# Apache Pulsar Docker Compose

In this folder path, run the following command to start the cluster.

```
docker-compose up
```

This command starts individual containers for the following services:

-   ZooKeeper (3)
-   BookKeeper (3)
-   Pulsar (3)
-   Proxy (1)
-   WebSocket (1)
-   Function (1)
-   Pulsar Manager (1)
-   SQL (1)

## Motivation

Most of what is available with Docker and Apache Pulsar uses the standalone version of Apache Pulsar, which is fantastic. But, users need to take care of all of the complexity of Apache Pulsar.

This aims to create a Docker implementation that allows each individual part to be exposed to learn how it all fits together.

## URLs

Assume that localhost addresses for the following endpoints are available:

-   [web-dashboard - http://localhost:9527](http://localhost:9527): pulsar-admin dashboard, showing various metrics and metadata information about the cluster

-   [broker-admin - http://localhost:8080](http://localhost:8080): access the broker REST interface

-   [broker-service-url - pulsar//:locahost:6650](pulsar//:locahost:6650): broker service URL for use with producers and consumers

You can shut it down with the following command in the folder path:

```
docker-compose down
```

You may need to delete the `./data` folder created by the Pulsar Manager.

## Notes

Docker is notorious for being difficult to manage the startup order of containers. In Pulsar, startup order is very significant. This may cause some containers to fail and have to be restarted.

Generally speaking, everything should be started up successfully in about 2 minutes.

If you plan to use this in production, more care should be taken on restart policies, logging, configuration, etc.

## To-Do

-   Add more SQL workers.
-   Dig into why PF_configurationStoreServers in fnc1 does not support a list of ZooKeeper instances.
-   Figure out why the dashboard ( v0.2.0) does not work correctly.
