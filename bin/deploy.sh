#!/bin/bash
PROJECT_PATH=$(dirname $(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd))
echo $PROJECT_PATH
image=elasticsearch:8.11.1
container=elasticsearch
network=elastic
docker network create $network || true
docker rm -f $container || true
docker build -t $image $PROJECT_PATH
docker run \
    --name $container \
    --net $network \
    -p 5100:9200 \
    -p 5101:9300 \
    -it \
    -d \
    $image
docker cp $container:/usr/share/elasticsearch/config/certs/http_ca.crt $PROJECT_PATH/assets/certs/http_ca.crt