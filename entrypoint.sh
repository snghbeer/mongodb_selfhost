#!/bin/bash

# Start cron in the background
cron && tail -f /var/log/cron.log &

# Start MongoDB as the main process
exec docker-entrypoint.sh mongod --auth
