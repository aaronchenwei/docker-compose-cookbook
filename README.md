# docker-compose-cookbook

A collection of Docker Compose(`compose.yaml`) files for quick setup to development environment.

## Prerequisite

-   Docker v20.13.10+
-   Docker Compose v2.3.3+

Follow the [installation guide](https://docs.docker.com/engine/install/) to install Docker Engine.

## How to Use

- Create a new directory since Docker Compose is using directory name as project name.
  
  ```sh
  $ mkdir zookeeper
  ```

- Copy the compose file `compose.yaml` into the new directory, along with any other necessary files. 

  ```sh
  $ cd zookeeper
  $ cp /<somewhere>/compose.yaml .
  ```

- Create (or modify) `.env` file for any envrionment variables setup. This step is optional.

  ```sh
  $ vim .env
  ```

- Execute command to bring up docker containers and tail the logs.

  ```sh
  $ docker compose up -d && docker compose logs -f
  ```
