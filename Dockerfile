FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.2-amqp \
      php8.2-bcmath \
      php8.2-bz2 \
      php8.2-cli \
      php8.2-curl \
      php8.2-gd \
      php8.2-gmp \
      php8.2-imap \
      php8.2-intl \
      php8.2-ldap \
      php8.2-mbstring \
      php8.2-mysql \
      php8.2-odbc \
      php8.2-opcache \
      php8.2-pgsql \
      php8.2-readline \
      php8.2-redis \
      php8.2-sqlite3 \
      php8.2-xml \
      php8.2-xmlrpc \
      php8.2-xsl \
      php8.2-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.4 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache