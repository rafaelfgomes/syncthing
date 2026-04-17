#!/bin/sh

echo ">> Iniciando Syncthing..."

exec su-exec syncthing "$@"