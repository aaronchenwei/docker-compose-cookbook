# docker-compose-cookbook

A collection of Docker Compose(`docker-compose.yml`) files for development environment setup.

## Prerequisite

Since Docker is announcing the [General Availability of Docker Compose Version 2 (aka V2)](https://www.docker.com/blog/announcing-compose-v2-general-availability/), V2 is adopted and used for this repository.

-   Docker v20.13.10+
-   Docker Compose v2.3.3+

### Docker Bridge Network

In order to avoid conflict between docker virtual network and host network, a pre-defined docker bridge network is used for some `docker-compose.ymal` in this repo. The subnet is `198.18.0.0/16`, which should be safe for a virutal network. `198.18.0.0/15` subnet as listed in RFC 3330 (but fully documented in RFC 2544) which is reserved for performance testing.

`docker0` is the default bridge network created upon Docker installation. However, `docker0` doesn't support name resolution. We have to create a new bridge network. Below is the command to create a bridge network with netowrk name `docker1`.

```sh
$ docker network create \
    --driver=bridge \
    --subnet=198.18.0.0/16 \
    --gateway=198.18.0.1 \
    -o com.docker.network.bridge.name=docker1 \
    docker1
```

In `docker-compose.ymal`, we could configure like below

```yaml
services:
    xxx:
        image: xxx/xxx:latest
        networks:
            - docker1

networks:
    docker1:
        external: true
```

If you prefer default networks, you can also specify subnet as below.

```ymal
networks:
  default:
    driver: bridge
    ipam:
      driver: default
      config:
      - subnet: 198.18.0.0/16
```
