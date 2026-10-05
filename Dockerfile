FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.5-amqp \
      php8.5-bcmath \
      php8.5-bz2 \
      php8.5-cli \
      php8.5-curl \
      php8.5-gd \
      php8.5-gmp \
      php8.5-imap \
      php8.5-intl \
      php8.5-ldap \
      php8.5-mbstring \
      php8.5-mysql \
      php8.5-odbc \
      php8.5-pgsql \
      php8.5-readline \
      php8.5-redis \
      php8.5-sqlite3 \
      php8.5-xml \
      php8.5-xmlrpc \
      php8.5-xsl \
      php8.5-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.4 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache