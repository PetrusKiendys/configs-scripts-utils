#!/bin/bash
# Remove untagged Docker images

docker images | grep "^<none>" | awk '{print $3}' | xargs docker rmi