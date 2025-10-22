#!/bin/sh

# Ensure user is ok for config files
find /config ! -user peertube -exec chown peertube:peertube {} \;

# Ensure user is ok for data files
find /data ! -user peertube -exec chown peertube:peertube {} \;

exit 0