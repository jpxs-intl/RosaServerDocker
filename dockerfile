FROM ubuntu:latest
RUN  /bin/sh -c "apt update && apt install opus-tools sqlite3 openssl ca-certificates wine -y && update-ca-certificates && useradd container -d /home/container -m"

USER container
ENV USER=container HOME=/home/container
ADD entrypoint.sh /entrypoint.sh

WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
