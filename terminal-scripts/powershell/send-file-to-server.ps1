# Example
# .\send-file-to-server.ps1 -FilePath "C:\Users\vsoil\Data\Belaz\welding-belaz\src\docker-compose\init-script.sql" -ServerFolderPath "~/" -RemoteHost 192.168.126.161 -RemoteUser svaradmin

param (
    [string]$FilePath,
    [string]$ServerFolderPath,
    [string]$RemoteHost,
    [string]$RemoteUser,
    [string]$RemoteSshPort = "22"
)

scp -P $RemoteSshPort $FilePath ${RemoteUser}@${RemoteHost}:${ServerFolderPath}