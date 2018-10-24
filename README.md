# makayel/supervisor

Docker image based on [centos:7.5.1804](https://hub.docker.com/_/centos/).

It include a process control system [supervisor](http://supervisord.org/).

## How to build the image ?
      docker build -t makayel/supervisor .

## How to run the container ?
      docker run -d --name makayel makayel/supervisor

## How to take control of the container ?
      docker exec -ti makayel /bin/bash
