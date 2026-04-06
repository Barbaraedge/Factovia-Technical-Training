# Use minimal Alpine Linux base image
FROM alpine:latest

# Install bash (optional, using sh by default in Alpine)
RUN apk add --no-cache bash

# Default command: infinite ascending counter starting from 1
CMD sh -c 'i=1; while true; do echo $i; i=$((i+1)); sleep 1; done'