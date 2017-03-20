#!/usr/bin/env bash

# run inside docker container
export DISCOVERY_URL=discovery-service:8080
export CONFIG_URL=config-service:8080
export CMD=${@:1}
/scripts/wait-for-it.sh -t 120 -s $DISCOVERY_URL -- /scripts/wait-for-it.sh -t 120 -s $CONFIG_URL -- $CMD
