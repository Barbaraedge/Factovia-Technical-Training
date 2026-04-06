#!/usr/bin/env bash

# Build a Docker image from the current directory (where the Dockerfile is located)
# -t assigns a human-readable name (tag) to the image
docker build -t alpine-counter .

# Verify that the image has been successfully created and is available locally
docker images | grep alpine-counter

# Run a container from the previously built image
# This will start the infinite counter process defined in CMD
docker run alpine-counter