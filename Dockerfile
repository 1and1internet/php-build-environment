FROM ubuntu:24.04

LABEL org.opencontainers.image.authors="developmentteamserenity@fasthosts.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      gpg-agent \
      curl \
      git \
      jq \
      mysql-client \
      nano \
      software-properties-common \
      tzdata \
      unzip \
      vim \
      telnet \
    && apt-get autoremove --purge -y \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get purge -y \
      software-properties-common \
      gpg-agent \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/
RUN chown 1000:1000 /app /tmp
USER 1000
ENV HOME /tmp
