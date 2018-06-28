FROM composer:1.6

ENV PATH=/tmp/vendor/bin:$PATH

ENV CODER_VERSION 8.2.12

RUN composer global require drupal/coder:"${CODER_VERSION}" \
    && phpcs --config-set installed_paths "${COMPOSER_HOME}/vendor/drupal/coder/coder_sniffer"


CMD ["phpcs", "--standard=Drupal", "--ignore=node_modules,*.css,*.md,*.txt", "/app"]
