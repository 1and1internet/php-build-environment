FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.3-amqp \
      php8.3-bcmath \
      php8.3-bz2 \
      php8.3-cli \
      php8.3-curl \
      php8.3-gd \
      php8.3-gmp \
      php8.3-imap \
      php8.3-intl \
      php8.3-ldap \
      php8.3-mbstring \
      php8.3-mysql \
      php8.3-odbc \
      php8.3-opcache \
      php8.3-pgsql \
      php8.3-readline \
      php8.3-redis \
      php8.3-sqlite3 \
      php8.3-xml \
      php8.3-xmlrpc \
      php8.3-xsl \
      php8.3-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.4 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache