#!/usr/bin/env sh

AGE=${AGE:-604800h}
STICKY_LABEL=${STICKY_LABEL:-persistent_image=true}

while true
do
  docker system prune --force --all --filter "until=$AGE" --filter "label!=$STICKY_LABEL"
  docker volume prune --force
  echo "🔔 Docker has pruned everything older than $AGE and unused volumes!"
  if [ -n "$SLEEP_INTERVAL" ]
  then
    echo "💤 Sleeping now for $SLEEP_INTERVAL ..."
    sleep "$SLEEP_INTERVAL"
  else
    break
  fi
done
