#!/bin/bash
containers=$(docker ps -a --filter "ancestor=chatanalysis" --format "{{.ID}}")  
ids=$(docker ps -a --filter "ancestor=chatanalysis" --format "{{.Names}},{{.ID}}")

if [[ -z "$containers" ]]; then
  echo "No more containers running chatanalysis image"
  exit 0
fi

echo "LOG : Containers running chatanalysis Image"
echo "------------------------------------------"
echo "NAME,ID"
for id in $ids; do
  echo "$id"
done

echo "LOG : Deleting Containers"
for container in $containers; do
  docker rm -f "$container"
done
