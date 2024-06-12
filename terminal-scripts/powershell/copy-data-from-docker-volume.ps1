# docker-compose_file-api-logs
# docker-compose_gateway-api-logs
# docker-compose_identity-api-logs
# docker-compose_registar-api-logs
# docker-compose_welding-api-logs

param (
    [string]$DockerVolumeName,
    [string]$EnvFilePath = ".\.env",
    [string]$LocalPath = ".\"
)

if (-not $DockerVolumeName) {
    Write-Error "DockerVolumeName parameter is required."
    exit 1
}

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

# Function to run a command
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

# Define the SSH command
$sshCommand = @"
mkdir -p "$REMOTE_HOME_PATH/$DockerVolumeName" &&
docker run -d --rm --name temp-container -v ${DockerVolumeName}:/volume_data alpine tail -f /dev/null &&
sleep 5 &&
docker cp temp-container:/volume_data/. $REMOTE_HOME_PATH/$DockerVolumeName &&
docker stop temp-container
"@

$plinkCommandArguments = "-ssh -pw $plainPassword -P $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST `"$sshCommand`""

Write-Host "Copy volume data from container on the remote server..."
$sshExitCode = Invoke-CommandAndShowOutput -CommandPath $plinkPath -Arguments $plinkCommandArguments

if ($sshExitCode -ne 0) {
    Write-Error "Error coping volume data from container on remote server."
    exit 1
}
Write-Host "Volume data copied successfully on remote server."

# Copy volume data to the local machine
$scpCommandArguments = "-P $REMOTE_SSH_PORT -pw $plainPassword -r $REMOTE_USER@${REMOTE_HOST}:${REMOTE_HOME_PATH}/$DockerVolumeName $LocalPath"

Write-Host "`nCopying volume data to the local machine..."
$scpExitCode = Invoke-CommandAndShowOutput -CommandPath $pscpPath -Arguments $scpCommandArguments

if ($scpExitCode -ne 0) {
    Write-Error "Error copying volume data to local machine."
    exit 1
}
Write-Host "Volume data copied successfully to local machine."

# Delete the volume data from the remote server
$deleteCommandArguments = "-ssh -pw $plainPassword -P $REMOTE_SSH_PORT $REMOTE_USER@$REMOTE_HOST rm -rf ${REMOTE_HOME_PATH}/$DockerVolumeName"

Write-Host "`nDeleting volume data from the remote server..."
$deleteExitCode = Invoke-CommandAndShowOutput -CommandPath $plinkPath -Arguments $deleteCommandArguments

if ($deleteExitCode -ne 0) {
    Write-Error "Error deleting volume data from remote server."
    exit 1
}
Write-Host "Volume data deleted from remote server."

Write-Host "`nCopy volume data process completed successfully!"