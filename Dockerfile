FROM frolvlad/alpine-mono:latest AS builder

RUN adduser -S -u 99 radarr && \
    apk add --no-cache mediainfo libmediainfo && \
    mkdir /config && \    
    chown radarr /config && \
    mkdir -p /mnt/user/downloads/tv && \
    mkdir -p /mnt/user/tv

USER radarr

WORKDIR /radarr
COPY --chown=radarr:nogroup _output/ ./

VOLUME /config
VOLUME /mnt/user/downloads/tv
VOLUME /mnt/user/tv

EXPOSE 7878

CMD ["mono", "--debug", "/radarr/Radarr.Console.exe", "-nobrowser", "-data=/config"]


