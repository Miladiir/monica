FROM monica:4.1.2-apache@sha256:caa1ec64a43d87112a3e5d8f4c50ddf89a44d3e510c1e01daef9f391c9ec31d3
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

