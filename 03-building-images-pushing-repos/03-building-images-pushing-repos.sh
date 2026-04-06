#!/usr/bin/env bash

# Build a Docker image from the Dockerfile in the current directory
# -t assigns a name (repository) and optionally a tag (defaults to :latest)
docker build -t alpine-counter .

# Tag the local image with a target repository and version
# This prepares the image to be pushed to a remote registry (e.g., Docker Hub)
docker tag alpine-counter:latest eramirezlopez/alpine-counter:1.0

# Authenticate against the remote container registry
# Required before pushing images
docker login

# Push the image to the remote repository
# If the tag does not exist remotely, it will be created automatically
docker push eramirezlopez/alpine-counter:1.0
