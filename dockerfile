FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl tar bash sqlite openssl ca-certificates opus-tools

# Create the container user
RUN adduser -D -h /home/container container

# Set some environment variables
ENV USER=container HOME=/home/container

# Copy over entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Copy over the server build
ADD --chown=container:container ./server.tar.gz /home/container/server.tar.gz

# Set User
USER container

# Set the working directory
WORKDIR /home/container

# Run the entrypoint script
CMD ["/bin/bash", "/entrypoint.sh"]
