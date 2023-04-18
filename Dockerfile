FROM debian:bullseye-slim
LABEL org.opencontainers.image.authors="allan.nava@hiway.media"
#
ARG DEBIAN_FRONTEND=noninteractive
#
RUN IMV='7.1.0-37' && \
    BUILD_TOOLS='alien' && \
    apt-get update && \
    apt-get install -y ${BUILD_TOOLS}  && \
    mkdir -p /tmp/imagemagick && \
    cd /tmp/imagemagick && \
    curl -o ImageMagick-${IMV}.x86_64.rpm -L "https://download.imagemagick.org/ImageMagick/download/linux/CentOS/x86_64/ImageMagick-${IMV}.x86_64.rpm" && \
    alien -ik ImageMagick-${IMV}.x86_64.rpm && \
    curl -o ImageMagick-libs-${IMV}.x86_64.rpm -L "https://download.imagemagick.org/ImageMagick/download/linux/CentOS/x86_64/ImageMagick-libs-${IMV}.x86_64.rpm" && \
    alien -ik ImageMagick-libs-${IMV}.x86_64.rpm && \
    apt-get purge -y ${BUILD_TOOLS} && \
    cd / && rm -rf /tmp/imagemagick && \
    apt-get -y purge man && \
    apt-get -y purge && \
    apt-get -y clean autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/{apt,dpkg,cache,log,lists}/*
#