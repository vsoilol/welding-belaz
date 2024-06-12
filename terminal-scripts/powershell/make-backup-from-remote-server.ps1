param (
    [string]$LocalBackupPath = ".\backup.sql",
    [string]$EnvFilePath = ".\.env.belaz"
)

$remoteServerPassword = Read-Host "Enter remote server password" -AsSecureString
$plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($remoteServerPassword))

# Load secrets from .env file
Get-Content $EnvFilePath | ForEach-Object {
    $key, $value = $_.Split('=')
    Set-Variable -Name $key -Value $value
}

# Function to check the availability of a command
function Get-CommandPath {
    param (
        [string]$CommandName
    )
    try {
        return (Get-Command $CommandName -ErrorAction Stop).Source
    }
    catch {
        Write-Error "$CommandName not found in system PATH. Please install PuTTY and ensure $CommandName is available in the PATH."
        exit 1
    }
}

# Function to run a command and show its output in real-time with infinite progress indicator
function Invoke-CommandAndShowOutput {
    param (
        [string]$CommandPath,
        [string]$Arguments
    )

    Write-Host

    $process = Start-Process -FilePath $CommandPath -ArgumentList $Arguments -NoNewWindow -Wait -PassThru

    Write-Host

    # Return the exit code
    return $process.ExitCode
}

# Get the full paths for plink and pscp
$plinkPath = Get-CommandPath "plink.exe"
$pscpPath = Get-CommandPath "pscp.exe"

# Create a backup of the database on the remote server
$sshCommand = "docker exec -t $DB_DOCKER_CONTAINER_NAME pg_dump -d $DB_NAME -p 5432 -U $DB_USER --no-owner --clean > $REMOTE_BACKUP_PATH"
$plinkCommandArguments = "-ssh -pw $plainPassword -P $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST `"$sshCommand`""

Write-Host "Creating a backup on the remote server..."
$sshExitCode = Invoke-CommandAndShowOutput -CommandPath $plinkPath -Arguments $plinkCommandArguments

if ($sshExitCode -ne 0) {
    Write-Error "Error creating backup on remote server."
    exit 1
}
Write-Host "Backup created successfully on remote server."

# Copy the backup file to the local machine
$scpCommandArguments = "-P $REMOTE_SSH_PORT -pw $plainPassword $REMOTE_USER@${REMOTE_HOST}:${REMOTE_BACKUP_PATH} $LocalBackupPath"

Write-Host "`nCopying the backup file to the local machine..."
$scpExitCode = Invoke-CommandAndShowOutput -CommandPath $pscpPath -Arguments $scpCommandArguments

if ($scpExitCode -ne 0) {
    Write-Error "Error copying backup to local machine."
    exit 1
}
Write-Host "Backup copied successfully to local machine."

# Delete the backup file from the remote server
$deleteCommandArguments = "-ssh -pw $plainPassword -P $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST rm $REMOTE_BACKUP_PATH"

Write-Host "`nDeleting the backup file from the remote server..."
$deleteExitCode = Invoke-CommandAndShowOutput -CommandPath $plinkPath -Arguments $deleteCommandArguments -Activity "Deleting backup file from remote server"

if ($deleteExitCode -ne 0) {
    Write-Error "Error deleting backup file from remote server."
    exit 1
}
Write-Host "Backup file deleted from remote server."

Write-Host "`nBackup process completed successfully!"