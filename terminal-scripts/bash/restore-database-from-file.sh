#!/bin/bash
source ./.env

BackupFilePath="./backup.sql"

dropdb -p $LOCAL_DB_PORT -U $LOCAL_DB_USER $LOCAL_DB_NAME
createdb -p $LOCAL_DB_PORT -U $LOCAL_DB_USER $LOCAL_DB_NAME

psql -U $LOCAL_DB_USER -d $LOCAL_DB_NAME -p $LOCAL_DB_PORT -f $BackupFilePath