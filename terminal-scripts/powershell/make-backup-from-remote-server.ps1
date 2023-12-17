# PowerShell script to backup a database from a remote server and copy it to the local machine

param (
    [string]$LocalBackupPath = ".\backup.sql",
    [string]$EnvFilePath = ".\.env"
)

# Load secrets from .env file
Get-Content $EnvFilePath | ForEach-Object {
    $key, $value = $_.Split('=')
    Set-Variable -Name $key -Value $value
}

Write-Host "Variable $REMOTE_HOST"

# Create a backup of the database on the remote server
$sshCommand = "docker exec -t $DB_DOCKER_CONTAINER_NAME pg_dump -d $DB_NAME -p 5432 -U $DB_USER --no-owner --clean > $REMOTE_BACKUP_PATH"
ssh -p $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST $sshCommand

# Copy the backup file to the local machine
scp -P $REMOTE_SSH_PORT ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_BACKUP_PATH} $LocalBackupPath

# Delete the backup file from the remote server
$deleteCommand = "rm $REMOTE_BACKUP_PATH"
ssh -p $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST $deleteCommand

Write-Host "Backup process completed!"