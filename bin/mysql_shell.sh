#!/usr/bin/env bash
#./venv/bin/docker-compose exec mariadb bash
echo "mysql -u nzedb -p"
./venv/bin/docker-compose exec mariadb mysql -u nzedb -p
