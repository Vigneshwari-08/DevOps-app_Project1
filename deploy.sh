#!/bin/bash

IMAGE_NAME=$1

echo "Pulling latest image..."
docker pull $IMAGE_NAME

echo "Stopping old container..."
docker stop devops-app || true

echo "Removing old container..."
docker rm devops-app || true

echo "Starting new container..."
docker run -d -p 80:80 --name devops-app $IMAGE_NAME

echo "Cleaning unused images..."
docker image prune -f

echo "Deployment completed!"