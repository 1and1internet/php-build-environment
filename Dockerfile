FROM 1and1internet/php-build-environment:8.2
LABEL org.opencontainers.image.authors development@fasthosts.co.uk

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.2-xdebug \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000