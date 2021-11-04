> Redis is able to start without a configuration file using a built-in default configuration, however this setup is only recommended for testing and development purposes.

```bash
$ docker compose up -d
$ docker compose exec redis-node-0 redis-cli --cluster-replicas 1 --cluster create 127.0.0.1:6380 127.0.0.1:6381 127.0.0.1:6382 127.0.0.1:6383 127.0.0.1:6384 127.0.0.1:6385
```
