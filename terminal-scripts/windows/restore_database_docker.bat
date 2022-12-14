@echo off

set filePath=../../database/init-script.sql
set containerId=postgresql_database
set database=welding-belaz
set username=admin

type %filePath% | docker exec -i %containerId% psql -U %username% -d %database%