#!/bin/bash

SCRIPT_WORKING_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "[+] Script working dir is [$SCRIPT_WORKING_DIR]"
cd "$SCRIPT_WORKING_DIR"

if [ ! -f "./Dockerfile" ]; then
  echo "No docker file has been detected, aborting"
  exit 1
fi

DOCKER_IMAGE_NAME="otus-kuber-intro"
DOCKER_CONTAINER_NAME="otus-intro"

docker build --tag "${DOCKER_IMAGE_NAME}:${1:-1.0}" .

if [ $# -gt 1 ] && [ "$2" == "run" ]; then
  docker rm --force ${DOCKER_CONTAINER_NAME}
  docker run --publish 8000:8000 -d --name ${DOCKER_CONTAINER_NAME} "${DOCKER_IMAGE_NAME}:${1:-1.0}"
fi

