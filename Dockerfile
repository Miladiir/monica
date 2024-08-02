FROM monica:4.1.2-apache@sha256:9c4d9cfed35fd08cd92a9c6374a6aed212c0664b90c004afe4b51cf4ea1652da
LABEL org.opencontainers.image.source="https://github.com/Miladiir/monica"

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"; \
    set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        supervisor \
    ; \
    rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

