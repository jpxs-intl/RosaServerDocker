FROM alpine:latest

# https://github.com/sgerrand/alpine-pkg-glibc/issues/208

ARG GLIBC_VER="2.35-r1"
ARG ALPINE_GLIBC_REPO="https://github.com/sgerrand/alpine-pkg-glibc/releases/download"
ARG SGERRAND_RSA_SHA256="823b54589c93b02497f1ba4dc622eaef9c813e6b0f0ebbb2f771e32adf9f4ef2"

RUN apk add --no-cache --virtual .build-deps curl binutils zstd gcompat && \
    curl -LfsS https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    echo "${SGERRAND_RSA_SHA256} */etc/apk/keys/sgerrand.rsa.pub" | sha256sum -c - && \
    curl -LfsS ${ALPINE_GLIBC_REPO}/${GLIBC_VER}/glibc-${GLIBC_VER}.apk > /tmp/glibc-${GLIBC_VER}.apk && \
    apk add --force-overwrite --no-cache /tmp/glibc-${GLIBC_VER}.apk && \
    apk del gcompat && \
    curl -LfsS ${ALPINE_GLIBC_REPO}/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk > /tmp/glibc-bin-${GLIBC_VER}.apk && \
    apk add --no-cache /tmp/glibc-bin-${GLIBC_VER}.apk && \
    curl -Ls ${ALPINE_GLIBC_REPO}/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk > /tmp/glibc-i18n-${GLIBC_VER}.apk && \
    apk add --no-cache /tmp/glibc-i18n-${GLIBC_VER}.apk

RUN apk add --no-cache opus sqlite gcc openssl zip gdb lz4
RUN update-ca-certificates 
RUN adduser container -h /home/container -D -s /bin/sh
USER container
ENV USER=container HOME=/home/container
ADD entrypoint.sh /entrypoint.sh

WORKDIR /home/container

CMD ["/bin/sh", "/entrypoint.sh"]
