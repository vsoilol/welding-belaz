# PowerShell script to copy data from a Docker volume to the local PC

param (
    [string]$DockerVolumeName
)

# PowerShell script to copy data from a Docker volume to a uniquely named folder on the local PC


# Define the base local path where the folder will be created
$baseLocalPath = "./"

# Create a folder name with volume name and date
$date = Get-Date -Format "yyyy-MM-dd"
$folderName = "$DockerVolumeName-$date"
$localPath = Join-Path $baseLocalPath $folderName

# Create the local directory
New-Item -ItemType Directory -Path $localPath -Force

# Name of the temporary container
$tempContainerName = "temp-container"

# Image to use (Alpine is a lightweight image)
$imageName = "alpine"

# Directory in container where volume will be mounted
$containerVolumePath = "/volume_data"

try {
    # Run a temporary Docker container with the volume mounted
    docker run -d --rm --name $tempContainerName -v ${DockerVolumeName}:${containerVolumePath} $imageName tail -f /dev/null

    # Wait for the container to be fully up and running
    Start-Sleep -Seconds 5

    # Copy data from Docker volume (in container) to the newly created local folder
    docker cp "${tempContainerName}:${containerVolumePath}/." $localPath

    # Output message
    Write-Host "Data copied successfully to $localPath"
}
catch {
    # Error handling
    Write-Error "An error occurred: $_"
}
finally {
    # Stop and remove the temporary container
    docker stop $tempContainerName
}

# End of script