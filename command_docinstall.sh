#!/usr/bin/ksh

docker build --no-cache --tag image_docker .
docker run -it image_docker

