#!/usr/bin/env bash

set -e

# Docker PostgreSQL image configuration
DOCKER_PG_IMAGE="timescale/timescaledb"
DOCKER_PG_TAG="latest-pg15"
DOCKER_PG="$DOCKER_PG_IMAGE:$DOCKER_PG_TAG"
IMG="$DOCKER_PG"

docker run -it --rm --network=host -v $PWD:/sql -w /sql -u "$STAT" "$IMG" $@

