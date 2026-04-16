FROM alpine:latest

RUN apk add --no-cache syncthing su-exec ca-certificates tzdata

ENV PUID=1000 \
    PGID=1000 \
    TZ=Etc/UTC \
    STGUIADDRESS=0.0.0.0:8384

RUN mkdir -p /var/syncthing /data

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Portas: 8384 (Web GUI), 22000/TCP-UDP (Sync), 21027/UDP (Discovery)
EXPOSE 8384 \
    22000/tcp \
    22000/udp \
    21027/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["syncthing", "serve", "--home", "/var/syncthing", "--gui-address", "0.0.0.0:8384"]