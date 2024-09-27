FROM monica:4.1.2-apache@sha256:2bf37a98c9c36e7e9b3df0af1fdf5e3ba0437d346fe4de344dd7bd9d867cc3e5
LABEL org.opencontainers.image.source="https://github.com/Miladiir/monica"

RUN <<EOF
    set -ex
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
    apt-get update
    apt-get install -y --no-install-recommends supervisor
    rm -rf /var/lib/apt/lists/*
EOF

COPY supervisord.conf /etc/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

