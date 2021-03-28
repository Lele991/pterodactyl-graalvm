# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM graalvm/graalvm-ce:latest:java8-21.0.0.2

MAINTAINER Lele991

RUN apt-get update -y \
    && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
    && useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
