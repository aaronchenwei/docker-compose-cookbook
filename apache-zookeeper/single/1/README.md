## Environment variables

ZooKeeper recommended defaults are used if `zoo.cfg` file is not provided. They can be overridden using the following environment variables.

### `ZOO_TICK_TIME`

Defaults to `2000`. ZooKeeper's `tickTime`

> The length of a single tick, which is the basic time unit used by ZooKeeper, as measured in milliseconds. It is used to regulate heartbeats, and timeouts. For example, the minimum session timeout will be two ticks

### `ZOO_INIT_LIMIT`

Defaults to `5`. ZooKeeper's `initLimit`

> Amount of time, in ticks (see tickTime), to allow followers to connect and sync to a leader. Increased this value as needed, if the amount of data managed by ZooKeeper is large.

### `ZOO_SYNC_LIMIT`

Defaults to `2`. ZooKeeper's `syncLimit`

> Amount of time, in ticks (see tickTime), to allow followers to sync with ZooKeeper. If followers fall too far behind a leader, they will be dropped.

### `ZOO_MAX_CLIENT_CNXNS`

Defaults to `60`. ZooKeeper's `maxClientCnxns`

>　Limits the number of concurrent connections (at the socket level) that a single client, identified by IP address, may make to a single member of the ZooKeeper ensemble.

### `ZOO_STANDALONE_ENABLED`

Defaults to `true`. Zookeeper's `standaloneEnabled`

> Prior to 3.5.0, one could run ZooKeeper in Standalone mode or in a Distributed mode. These are separate implementation stacks, and switching between them during run time is not possible. By default (for backward compatibility) standaloneEnabled is set to true. The consequence of using this default is that if started with a single server the ensemble will not be allowed to grow, and if started with more than one server it will not be allowed to shrink to contain fewer than two participants.

### `ZOO_ADMINSERVER_ENABLED`

Defaults to `true`. Zookeeper's `admin.enableServer`

> The AdminServer is an embedded Jetty server that provides an HTTP interface to the four letter word commands. By default, the server is started on port 8080, and commands are issued by going to the URL "/commands/[command name]", e.g., http://localhost:8080/commands/stat.

### `ZOO_AUTOPURGE_PURGEINTERVAL`

Defaults to `0`. Zookeeper's `autoPurge.purgeInterval`

> The time interval in hours for which the purge task has to be triggered. Set to a positive integer (1 and above) to enable the auto purging. Defaults to 0.

### `ZOO_AUTOPURGE_SNAPRETAINCOUNT`

Defaults to `3`. Zookeeper's `autoPurge.snapRetainCount`

> When enabled, ZooKeeper auto purge feature retains the autopurge.snapRetainCount most recent snapshots and the corresponding transaction logs in the dataDir and dataLogDir respectively and deletes the rest. Defaults to 3. Minimum value is 3.

### `ZOO_4LW_COMMANDS_WHITELIST`

Defaults to srvr. Zookeeper's 4lw.commands.whitelist

> A list of comma separated Four Letter Words commands that user wants to use. A valid Four Letter Words command must be put in this list else ZooKeeper server will not enable the command. By default the whitelist only contains "srvr" command which zkServer.sh uses. The rest of four letter word commands are disabled by default.

## Advanced configuration

### `ZOO_CFG_EXTRA`

Not every Zookeeper configuration setting is exposed via the environment variables listed above. These variables are only meant to cover minimum configuration keywords and some often changing options. If mounting your custom config file as a volume doesn't work for you, consider using ZOO_CFG_EXTRA environment variable. You can add arbitrary configuration parameters to Zookeeper configuration file using this variable. The following example shows how to enable Prometheus metrics exporter on port 7070:

```sh
$ docker run --name some-zookeeper --restart always -e ZOO_CFG_EXTRA="metricsProvider.className=org.apache.zookeeper.metrics.prometheus.PrometheusMetricsProvider metricsProvider.httpPort=7070" zookeeper
```

### `JVMFLAGS`

Many of the Zookeeper advanced configuration options can be set there using Java system properties in the form of -Dproperty=value. For example, you can use Netty instead of NIO (default option) as a server communication framework:

```sh
$ docker run --name some-zookeeper --restart always -e JVMFLAGS="-Dzookeeper.serverCnxnFactory=org.apache.zookeeper.server.NettyServerCnxnFactory" zookeeper
```
See Advanced Configuration for the full list of supported Java system properties.

Another example use case for the JVMFLAGS is setting a maximum JWM heap size of 1 GB:

```sh
$ docker run --name some-zookeeper --restart always -e JVMFLAGS="-Xmx1024m" zookeeper
```

## Replicated mode

Environment variables below are mandatory if you want to run Zookeeper in replicated mode.

### `ZOO_MY_ID`

The id must be unique within the ensemble and should have a value between 1 and 255. Do note that this variable will not have any effect if you start the container with a /data directory that already contains the myid file.

### `ZOO_SERVERS`

This variable allows you to specify a list of machines of the Zookeeper ensemble. Each entry should be specified as such: server.id=<address1>:<port1>:<port2>[:role];[<client port address>:]<client port> Zookeeper Dynamic Reconfiguration. Entries are separated with space. Do note that this variable will not have any effect if you start the container with a /conf directory that already contains the zoo.cfg file.
