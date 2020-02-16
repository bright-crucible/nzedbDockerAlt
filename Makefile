.PHONY: build letsencrypt predb logs start stop status shell mysql tmuxstop tail time venv

COMPOSE="venv/bin/docker-compose"

help:
	@echo "Minecraft in a container!"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo " build       - build docker images locally"
	@echo " dbtimezone  - set timezone info into database"
	@echo " help        - print this help"
	@echo " letsencrypt - run letsencrypt renewal"
	@echo " logs        - print container logs"
	@echo " predb       - run preDB importer"
	@echo " status      - show running container ps info"
	@echo " shell       - launch shell in nzedb container"
	@echo " start       - launch the container(s)"
	@echo " stop        - stop container(s)"
	@echo " tmuxstop    - stop tmux"
	@echo " tail        - tail the logs"
	@echo " mysql       - launch shell in mysql container"
	@echo " venv        - first time use to setup virtual env"


build:
	@bin/build_nzedb

dbtimezone:
	@bin/db_timezone

letsencrypt:
	@bin/run_le

logs:
	@$(COMPOSE) logs

predb:
	@bin/run_predb_import.sh

start:
	@bin/start_nzedb

stop:
	@bin/stop_nzedb

tmuxstop:
	@bin/stop_tmux.sh

status:
	@$(COMPOSE) ps

shell:
	@bin/nzedb_shell.sh

mysql:
	@bin/mysql_shell.sh

tail:
	@$(COMPOSE) logs -f

venv:
	@bin/build_virtualenv
