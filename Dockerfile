FROM monica:4.1.2-apache@sha256:64c41837c2e83f766bea1adc5d8ab8606da9812452c89a67ac24fce1a3388d72
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

