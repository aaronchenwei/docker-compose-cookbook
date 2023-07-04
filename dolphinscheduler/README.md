https://dolphinscheduler.apache.org/en-us/docs/latest/user_doc/guide/start/docker.html

```sh
# Initialize the database, use profile schema
$ docker-compose --profile schema up -d

# start all dolphinscheduler server, use profile all
$ docker-compose --profile all up -d
```


https://github.com/apache/dolphinscheduler/blob/dev/deploy/docker/docker-compose.yml
