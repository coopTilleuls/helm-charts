#!/bin/sh

# Populate config directory
if [ -z "$(ls -A /config)" ]; then
    cp /app/support/docker/production/config/* /config
fi

# Always copy default and custom env configuration file, in cases new keys were added
cp /app/config/default.yaml /config
cp /app/support/docker/production/config/custom-environment-variables.yaml /config
# From 5.2 peertube upgrade script creates a production.yaml.new containing production.yml config and news mandatory keys, directly usable
if [ -f "/config/production.yaml.new" ]; then
    mv /config/production.yaml.new /config/production.yaml
fi
# Patch user after the cp
find /config ! -user peertube -exec chown peertube:peertube {} \;

# Move videos data for Peertube 6.0.0 before starting peertube
if [ -d "/data/videos" -a ! -d "/data/web-videos" ]; then
    mv /data/videos /data/web-videos
fi

# Prepare assets for the Nginx sidecar
cp -r /app/client/dist/* /assets/

exit 0
