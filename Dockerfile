FROM monica:4.1.2-apache@sha256:858f3a0878fabbe4a0e3d24f85cc1be9fda6cdaec6c96e846a7c192dac1d418b
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

