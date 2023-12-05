#!/bin/bash
PROJECT_PATH=$(dirname $(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd))
echo $PROJECT_PATH
image=elasticsearch:8.11.1
container=elasticsearch
network=elastic
docker network create $network || true
docker build -t $image $PROJECT_PATH