#Docker Minecraft#
[![Build Status](https://jenkins.dray.be/buildStatus/icon?job=docker_minecraft)](https://jenkins.dray.be/job/docker_minecraft)

This is a docker image for Minecraft running on an Alpine linux container

##Usage##
Map the directory with the minecraft server jar to /minecraft.

The file /minecraft/conf.override overrides any configuration used, including specifying a different minecraft jar.
See conf.defaults for a list of configuration options you can override
