FROM ubuntu:latest
RUN  /bin/sh -c "dpkg --add-architecture i386 && apt-get update && apt-get install opus-tools sqlite3 openssl libstdc++6 libc6 ca-certificates wine wine32 -y && update-ca-certificates && useradd container -d /home/container -m"

USER container
ENV USER=container HOME=/home/container
ADD entrypoint.sh /entrypoint.sh

WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
