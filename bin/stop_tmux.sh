#!/usr/bin/env bash
./venv/bin/docker-compose exec -T --user nzedb nzedb php stop.php
./venv/bin/docker-compose exec -T --user nzedb nzedb killall tmux
