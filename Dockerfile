FROM frolvlad/alpine-mono:latest AS builder

RUN adduser -S -u 99 radarr && \
    apk add --no-cache mediainfo && \
    mkdir /config && \    
    chown radarr /config && \
    mkdir -p /mnt/user/downloads/tv && \
    mkdir -p /mnt/user/tv

USER radarr

WORKDIR /radarr
COPY --chown=radarr:users _output/ ./

VOLUME /config
VOLUME /mnt/user/downloads/movies
VOLUME /mnt/user/movies

EXPOSE 7878

CMD ["mono", "--debug", "/radarr/Radarr.exe", "-nobrowser", "-data=/config"]


