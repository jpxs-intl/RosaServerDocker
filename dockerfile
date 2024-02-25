FROM ghcr.io/jpxs-intl/rosaserverdocker:ubuntu

LABEL maintainer="gart <gart@gart.sh>"
LABEL TAG="ubuntu-wine"

RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install wine wine32 -y
