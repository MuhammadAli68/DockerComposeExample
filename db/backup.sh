#!/bin/bash

# Timestamp for backup filename
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Perform backup using pg_dump
pg_dump -U myuser -h db mydb > /backups/backup_${TIMESTAMP}.sql