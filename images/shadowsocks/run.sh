#!/usr/bin/env bash

docker run -it --name shadowsocks --restart unless-stopped \
 -p 8388:8388 \
 -v $(pwd)/etc:/etc/shadowsocks \
 3mpr/shadowsocks:latest
