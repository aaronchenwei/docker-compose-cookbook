# docker-compose-cookbook

A collection of docker-compose.yml files for development environment setup. `docker-compose` version 1.27+ is used.

## Note

~~Since v2.x format is intended for `docker-compose` and v3.x is intended for `swarm stack deployments`, `docker-compose.yml` used in this project is based on [v2 format](https://docs.docker.com/compose/compose-file/compose-file-v2/) for development envrionment setup.~~

The new [Docker Compose spec](https://github.com/compose-spec/compose-spec/blob/master/spec.md#compose-file) supports not defining a version property and is the recommended way to go moving forward. It supports both v2 and v3 properties. That makes above paragraph a little outdated.

If you don’t see a version property at all that means 1 of 2 things depending on what version of docker-compose you’re using. But the TL;DR takeaway is since late 2020 (Docker Compose 1.27+) you shouldn’t define a version property.

Between early 2016 (Docker Compose 1.6+) and late 2020 not defining a version was considered legacy because v2 and v3 existed. Not defining a version was classified as v1 back then and it didn’t support named volumes, networking or custom build arguments.

Then in Docker Compose 1.27+, Docker deprecated the version property and it’s mainly supported now for backwards compatibility. It supports everything without it.
