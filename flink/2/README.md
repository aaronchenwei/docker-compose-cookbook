-   Launch a cluster in the foreground (use -d for background)

```sh
$ docker-compose up
```

-   Scale the cluster up or down to N TaskManagers

```sh
$ docker-compose scale taskmanager=<N>
```

-   Access the JobManager container

```sh
$ docker exec -it $(docker ps --filter name=jobmanager --format={{.ID}}) /bin/sh
```

-   Kill the cluster

```sh
$ docker-compose down
```

-   Access Web UI

When the cluster is running, you can visit the web UI at http://localhost:8081.
