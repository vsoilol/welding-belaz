@echo off

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%b-%%a-%%c)

set database=weldingBelaz
set port=5434
set username=postgres
set pathToFolder=../../database/init-script.sql
set fullPath=%pathToFolder%

pg_dump -d %database% -p %port% -U %username% --no-owner > %fullPath%
