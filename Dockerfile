FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.4-amqp \
      php8.4-bcmath \
      php8.4-bz2 \
      php8.4-cli \
      php8.4-curl \
      php8.4-gd \
      php8.4-gmp \
      php8.4-imap \
      php8.4-intl \
      php8.4-ldap \
      php8.4-mbstring \
      php8.4-mysql \
      php8.4-odbc \
      php8.4-opcache \
      php8.4-pgsql \
      php8.4-readline \
      php8.4-redis \
      php8.4-sqlite3 \
      php8.4-xml \
      php8.4-xmlrpc \
      php8.4-xsl \
      php8.4-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.10 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin
# Temporary: re-enable advisory blocking once its impact on app pipelines is assessed
ENV COMPOSER_NO_SECURITY_BLOCKING=1

RUN composer global require psy/psysh && composer clear-cache