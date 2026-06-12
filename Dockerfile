FROM monica:4.1.2-apache@sha256:8ff07c9030c7810a0d4e5ed5fd67366d03d5acfed9f33ea0631b46e8800b7f57
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

