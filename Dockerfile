FROM monica:4.1.2-apache@sha256:1030f76cf72730270e6d418295450be4e6918bcfed8106fa9f80b2d4cb02bd99
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

