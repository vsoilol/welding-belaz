#!/bin/sh

filePath="../../database/init-script.sql"
containerId="postgresql_database"
database="welding-belaz"
username="admin"

cat %filePath% | docker exec -i %containerId% psql -U %username% -d %database%