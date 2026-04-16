#!/bin/sh

PUID=${PUID:-1000}

PGID=${PGID:-1000}

echo ">> Configurando Syncthing com UID: $PUID e GID: $PGID"

addgroup -g "$PGID" syncthing 2>/dev/null || true

adduser -D -H -u "$PUID" -G syncthing -s /bin/sh syncthing 2>/dev/null || true

chown -R syncthing:syncthing /var/syncthing

chown -R syncthing:syncthing /data

echo ">> Iniciando Syncthing..."

exec su-exec syncthing "$@"