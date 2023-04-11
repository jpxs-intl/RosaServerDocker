FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl tar bash sqlite openssl ca-certificates opus-tools

# Create the container user
RUN adduser -D -h /home/container container
USER container

# Set some environment variables
ENV USER=container HOME=/home/container

# Copy over entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Set the working directory
WORKDIR /home/container

# Copy over the files
COPY --chown=container:container ./server/ /home/container/

# Run the entrypoint script
CMD ["/bin/bash", "/entrypoint.sh"]
