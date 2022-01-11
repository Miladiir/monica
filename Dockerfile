FROM monica:3.6.0-apache@sha256:e0ace4f1faee46830a80a2f5c71ca934a72ac0617ea57e1469e8133ae1e23c5d
LABEL org.opencontainers.image.source = "https://github.com/Miladiir/monica"

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# supervisord dependencies
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        supervisor \
    ; \
    rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

