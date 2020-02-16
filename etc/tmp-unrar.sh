#!/usr/bin/env bash
set -e
mount tmpfs /home/parias/nzedb/data/tmp -t tmpfs -o uid=1001,gid=1001,nodev,nodiratime,noexec,nosuid,size=256M
mkdir -m777 /home/parias/nzedb/data/tmp/unrar
chown parias:parias /home/parias/nzedb/data/tmp/unrar
