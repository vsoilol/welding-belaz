@echo off

set containerId=postgresql_database
set database=welding-belaz
set port=5432
set username=admin
set pathToFolder=../../database/init-script.sql
set fullPath=%pathToFolder%

docker exec -t %containerId% pg_dump -d %database% -p %port% -U %username% --no-owner --clean > %fullPath%