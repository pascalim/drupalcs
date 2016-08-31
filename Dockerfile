FROM php:7.0.10-alpine

COPY php/ /usr/local/etc/php/conf.d/

ENV COMPOSER_HOME=/composer \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PATH=/composer/vendor/bin:$PATH \
    CODER_VERSION=8.2.8

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
      git \
    && curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && composer global require drupal/coder:"${CODER_VERSION}" \
    && phpcs --config-set installed_paths "${COMPOSER_HOME}/vendor/drupal/coder/coder_sniffer" \
    && apk del .build-deps

WORKDIR /workspace

CMD ["phpcs", "--standard=Drupal", "--extensions=php,module,inc,install,test,profile,theme", "/workspace"]
