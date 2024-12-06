#!/bin/bash

# Define MongoDB container name
CONTAINER_NAME="mongow"

# Define MongoDB username and password
USERNAME="adminUser"
PASSWORD="adminPass"

# Execute mongodump command
BACKUP_DIR="/data/db/dump"

if [ ! -d $BACKUP_DIR ]; then
  mkdir -p $BACKUP_DIR
fi

mongodump --username $USERNAME --password $PASSWORD --authenticationDatabase admin  --out $BACKUP_DIR


# Compress the backup folders into a zip file
current_date=$(date +%Y-%m-%d)
# Convert the date to a string
date_string=$(echo "$current_date")

# Compose the backup filename with the date string
TAR_FILENAME="backup_${date_string}.tar.gz"
FULL_FILE_PATH="/data/db/${TAR_FILENAME}"

# Compress the backup folders into a tar.gz archive
tar -czvf $FULL_FILE_PATH -C $BACKUP_DIR .

# Get the size of the archive file in megabytes
ARCHIVE_SIZE=$(du -sm $FULL_FILE_PATH | awk '{print $1}')
# Echo the size of the archive file in megabytes

echo "Filename: ${TAR_FILENAME}"
echo "Backup archive size: ${ARCHIVE_SIZE} MB"

# Transfer the archive file to your server (replace with appropriate commands)
SERVER_HOST="your_server_hostname"
SERVER_USERNAME="your_server_username"
SERVER_DESTINATION="/path/to/destination"
#scp $TAR_FILENAME $SERVER_USERNAME@$SERVER_HOST:$SERVER_DESTINATION

# Clean up the archive file
 #rm $TAR_FILENAME