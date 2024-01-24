FROM 1and1internet/php-build-environment:8.3
LABEL org.opencontainers.image.authors development@fasthosts.co.uk

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.3-xdebug \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000