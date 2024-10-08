FROM ubuntu:jammy

LABEL maintainer="gart <gart@gart.sh>"
LABEL TAG="ubuntu"

RUN dpkg --add-architecture i386

RUN apt-get update -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN apt-get update -y

RUN apt-get install opus-tools sqlite3 openssl libstdc++6 libc6 ca-certificates libogg-dev gdb zip gdbserver -y
RUN update-ca-certificates

RUN useradd container -d /home/container -m
USER container
ENV USER=container HOME=/home/container

ADD entrypoint.sh /entrypoint.sh
WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
