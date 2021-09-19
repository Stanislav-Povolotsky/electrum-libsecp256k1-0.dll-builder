#!/bin/bash
set -e

container_name=electrum-builder

! docker stop $container_name-instance
! docker kill --signal=9 $container_name-instance
! rm -rf ./build-results >/dev/null 2>&1

mkdir ./build-results

docker build -t $container_name ./docker
docker run -it --rm -v `pwd`/build-results:/root/build-results --name $container_name-instance $container_name
