FROM monica:4.1.2-apache@sha256:351cbb796282e31eb536e86d5efdb14614be10acf648e727a15947b353b3dfea
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

