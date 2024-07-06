FROM monica:4.1.2-apache@sha256:14d9015003b16eaee9cefe704b9b5c2818a963efbff94b68c34f7ebdf04832b0
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

