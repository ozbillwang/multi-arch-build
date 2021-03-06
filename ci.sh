#!/bin/bash

set -x

docker buildx inspect

if [ "$TRAVIS_PULL_REQUEST" = "true" ] || [ "$TRAVIS_BRANCH" != "master" ]; then
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
  docker buildx build \
    --progress plain \
    --platform=linux/amd64,linux/386,linux/arm/v7,linux/arm/v6 \
    --tag demo \
    --load .
  exit $?
fi

docker images
