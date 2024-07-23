FROM monica:4.1.2-apache@sha256:594c9762631b54161d76facb7989ab949972733a9111d116e7360f2b1f0c6895
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

