#!/bin/sh

RUN chown -R syncthing:syncthing /data

echo ">> Iniciando Syncthing..."

exec su-exec syncthing "$@"