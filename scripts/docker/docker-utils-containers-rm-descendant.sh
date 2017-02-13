#!/bin/bash
# Remove all descendant Docker containers

docker ps -a --filter ancestor=$1 | awk '{print $1}' | sed -n '1!p' | xargs docker rm $2