#!/bin/bash

# Define MongoDB container name
CONTAINER_NAME="mongow"
directory="/data/db/dump"

# Define MongoDB username and password
USERNAME="adminUser"
PASSWORD="adminPass"

# Execute mongorestore command
mongorestore --username=$USERNAME --password=$PASSWORD --authenticationDatabase=admin --archive=$directory
