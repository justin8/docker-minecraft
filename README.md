# Docker Minecraft
[![Build Status](https://jenkins.dray.be/buildStatus/icon?job=docker_minecraft)](https://jenkins.dray.be/job/docker_minecraft)

This is a docker image for Minecraft running on an Alpine linux container

## Usage
The file /minecraft/conf.override overrides any configuration used, including specifying a different minecraft jar.
See conf.defaults for a list of configuration options you can override

### Docker compose
The easiest way to use this is with docker compose. Just place your minecraft folder inside the data folder and run `docker-compose up`

### Manually running the image
You just need to map the directory with the minecraft server jar to /minecraft.
`docker run --rm -v /foo/minecraft:/minecraft -p 25565:25565 justin8/minecraft

