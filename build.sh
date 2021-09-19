#!/bin/bash
set -e
container_name=electrum-builder
script_dir=$(dirname "$(readlink -f "$0")")
results_dir=`pwd`/build-results

! docker stop $container_name-instance
! docker kill --signal=9 $container_name-instance
! rm -rf "$results_dir" >/dev/null 2>&1
mkdir "$results_dir"

docker build -t $container_name "$script_dir/docker"
docker run -it --rm -v "$results_dir:/root/build-results" --name $container_name-instance $container_name

echo "Done. You can find windows binaries here: $results_dir"
