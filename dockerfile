FROM alpine:latest
RUN apk add --no-cache opus sqlite gcc openssl zip gdb ca-certificates lz4
RUN update-ca-certificates 
RUN adduser container -h /home/container -D -s /bin/sh
USER container
ENV USER=container HOME=/home/container
ADD entrypoint.sh /entrypoint.sh

WORKDIR /home/container

CMD ["/bin/sh", "/entrypoint.sh"]
