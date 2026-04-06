# Use lightweight Alpine base image
FROM alpine:latest

# Install netcat (nc) for simple TCP server
RUN apk add --no-cache netcat-openbsd

# Expose port 3000
EXPOSE 3000

# Start a simple TCP server that responds with "pong"
CMD sh -c 'while true; do echo -e "HTTP/1.1 200 OK\r\n\r\npong" | nc -l -p 3000; done'