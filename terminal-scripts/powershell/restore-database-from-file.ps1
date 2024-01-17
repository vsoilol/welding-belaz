param (
    [string]$BackupFilePath = ".\backup.sql",
    [string]$EnvFilePath = ".\.env.local"
)

# Load secrets from .env file
Get-Content $EnvFilePath | ForEach-Object {
    $key, $value = $_.Split('=')
    Set-Variable -Name $key -Value $value
}

dropdb -p $LOCAL_DB_PORT -U $LOCAL_DB_USER $LOCAL_DB_NAME
createdb -p $LOCAL_DB_PORT -U $LOCAL_DB_USER $LOCAL_DB_NAME

psql -U $LOCAL_DB_USER -d $LOCAL_DB_NAME -p $LOCAL_DB_PORT -f $BackupFilePath