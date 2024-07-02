FROM monica:4.1.2-apache@sha256:03f20daa3f2ba5835c8ada21829ea16756774154b2e6128f082c0eb4b987975f
LABEL org.opencontainers.image.source = "https://github.com/Miladiir/monica"

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

