#!/usr/bin/env bash

# List all locally available Docker images (including repository, tag, and size)
docker images

# Pull the latest version of the official NGINX image from the default registry (Docker Hub)
docker pull nginx

# Verify that the NGINX image has been successfully downloaded and is present locally
docker images

# Create and start a container from the NGINX image:
# - Maps host port 80 to container port 80 (HTTP traffic exposure)
# - Runs NGINX in the foreground using default configuration
docker run -p 80:80 nginx
