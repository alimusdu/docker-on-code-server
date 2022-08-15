FROM ghcr.io/linuxserver/baseimage-ubuntu:focal


RUN \
  echo "**** install runtime dependencies ****" && \
  apt-get update && \
  apt-get install -y \
    wget \
    git \
    jq \
    libatomic1 \
    nano \
    net-tools \
    sudo && \
  echo "**** install code-server ****" && \
  wget -O- https://aka.ms/install-vscode-server/setup.sh | sh && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /etc/apt/sources.list.d/nodesource.list
    
EXPOSE 8000

ENTRYPOINT ["code-server", "serve-local", "--host", "0.0.0.0", "-p", "8000",  "--accept-server-license-terms", "--without-connection-token"]