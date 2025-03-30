#!/bin/bash

while getopts "i:" opt; do
  case $opt in
    i) image_name="$OPTARG" ;;
    *) echo "Usage: $0 -i <image_name>"; exit 1 ;;
  esac
done

if [[ -z "$image_name" ]]; then
  echo "Error: Image name is required"
  echo "Usage: $0 -i <image_name>"
  exit 1
fi

containers=$(docker ps -a --filter "ancestor=$image_name" --format "{{.ID}}")  
ids=$(docker ps -a --filter "ancestor=$image_name" --format "{{.Names}},{{.ID}}")

if [[ -z "$containers" ]]; then
  echo "No more containers running $image_name image"
  exit 0
fi

echo "LOG : Containers running $image_name Image"
echo "------------------------------------------"
echo "NAME,ID"
for id in $ids; do
  echo "$id"
done

echo "LOG : Deleting Containers"
for container in $containers; do
  docker rm -f "$container"
done
