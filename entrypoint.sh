#!/usr/bin/env sh

while true
do
  echo "🔔 Docker was pruned everything older than $AGE and unused volumes !"
  docker system prune --force --all --filter "until=$AGE" --filter "label!=$STICKY_LABEL"
  docker volume prune --force
  if [ -n "$SLEEP_INTERVAL" ]
  then
    echo "💤 Sleeping now for $SLEEP_INTERVAL ..."
    sleep "$SLEEP_INTERVAL"
  else
    break
  fi
done
