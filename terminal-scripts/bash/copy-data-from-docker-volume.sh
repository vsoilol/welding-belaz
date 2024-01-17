#!/bin/bash

# Check if Docker volume name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <docker-volume-name>"
    exit 1
fi

# Define Docker volume name from script arguments
DockerVolumeName=$1

# Define the base local path where the folder will be created
baseLocalPath="./"

# Create a folder name with volume name and date
date=$(date +"%Y-%m-%d")
folderName="${DockerVolumeName}-${date}"
localPath="${baseLocalPath}${folderName}"

# Create the local directory
mkdir -p "$localPath"

# Name of the temporary container
tempContainerName="temp-container"

# Image to use (Alpine is a lightweight image)
imageName="alpine"

# Directory in container where volume will be mounted
containerVolumePath="/volume_data"

# Run a temporary Docker container with the volume mounted
docker run -d --rm --name $tempContainerName -v ${DockerVolumeName}:${containerVolumePath} $imageName tail -f /dev/null

# Wait for the container to be fully up and running
sleep 5

# Copy data from Docker volume (in container) to the newly created local folder
docker cp "${tempContainerName}:${containerVolumePath}/." "$localPath"

# Stop and remove the temporary container
docker stop $tempContainerName

echo "Data copied successfully to $localPath"
