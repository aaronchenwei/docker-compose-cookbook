```bash
$ docker compose up -d
$ docker compose exec redis-node-0 redis-cli --cluster-replicas 1 --cluster create 127.0.0.1:6380 127.0.0.1:6381 127.0.0.1:6382 127.0.0.1:6383 127.0.0.1:6384 127.0.0.1:6385
```
