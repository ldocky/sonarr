FROM ubuntu:focal
MAINTAINER ldocky


ENV DEBIAN_FRONTEND=noninteractive
ENV XDG_CONFIG_HOME="/config/xdg"

RUN apt-get update && apt-get install -y gnupg ca-certificates

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2009837CBFFD68F45BC180471F4F90DE2A9B4BF8 && \
echo "deb https://apt.sonarr.tv/ubuntu focal main" | tee /etc/apt/sources.list.d/sonarr.list && \
apt-get update

RUN apt-get install -y \
sonarr

EXPOSE 8989
VOLUME /config


ENTRYPOINT ["mono"]
