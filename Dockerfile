FROM ubuntu:xenial

RUN echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    dpkg --add-architecture i386 && \
    apt-get -q -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
      lib32gcc1 steamcmd ca-certificates gosu && \
    ln -sf /usr/games/steamcmd /usr/bin/steamcmd && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -q -y && \
    rm -rf /var/lib/apt/lists/*

RUN steamcmd +login anonymous +force_install_dir /home/ark/server +app_update 376030 +quit