FROM ghcr.io/jpxs-intl/rosaserverdocker:ubuntu

LABEL maintainer="gart <gart@gart.sh>"
LABEL TAG="ubuntu-wine"

RUN apt-get install wine wine32 -y

CMD ["/bin/bash", "/entrypoint.sh"]
