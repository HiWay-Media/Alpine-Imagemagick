FROM alpine:3.8
LABEL org.opencontainers.image.authors="allan.nava@hiway.media"
#
RUN apk update
RUN apk add --no-cache imagemagick bash pngcrush optipng=0.7.7-r0
#
CMD ["/bin/bash"]
#