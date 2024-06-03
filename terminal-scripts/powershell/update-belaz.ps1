param (
    [string]$GitBranchName
)

$remoteServerPassword = Read-Host "Enter remote server password" -AsSecureString

# Check if BranchName is provided
if (-not $GitBranchName) {
    Write-Error "GitBranchName parameter is required."
    exit 1
}

# Automatically find the path to Plink and PSCP
try {
    $plinkPath = (Get-Command plink.exe -ErrorAction Stop).Source
}
catch {
    Write-Error "Plink.exe not found in system PATH. Please install PuTTY and ensure Plink.exe is available in the PATH."
    exit 1
}

try {
    $pscpPath = (Get-Command pscp.exe -ErrorAction Stop).Source
}
catch {
    Write-Error "PSCP.exe not found in system PATH. Please install PuTTY and ensure PSCP.exe is available in the PATH."
    exit 1
}

# Function to execute an SSH command
function Invoke-SSHCommand {
    param (
        [string]$address,
        [string]$user,
        [SecureString]$password,
        [string]$command
    )

    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

    Start-Process -NoNewWindow -Wait -FilePath $plinkPath -ArgumentList "-ssh -pw $plainPassword $user@$address `"$command`""
}

# Define the SSH command
$sshCommand = @"
cd ~/welding-belaz &&
git fetch --all &&
git checkout $GitBranchName &&
git pull origin $GitBranchName
"@

# Execute the SSH command
Write-Host "Executing Git commands on the remote server..."
Invoke-SSHCommand -address "192.168.126.161" -user "svaradmin" -password $remoteServerPassword -command $sshCommand

$sshDockerCommand = @"
cd ~/welding-belaz/src/docker-compose &&
docker compose build &&
docker compose down &&
docker compose up -d
"@

Write-Host "Run docker..."
Invoke-SSHCommand -address "192.168.126.161" -user "svaradmin" -password $remoteServerPassword -command $sshDockerCommand