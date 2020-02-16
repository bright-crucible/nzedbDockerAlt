# nzedbDockerAlt
My own version of containers for nzedb

To initialize nZEDb in data/, uncomment export in docker-compose.yml
This then allows an exec into export to grab the tar.xz

exec:
./venv/bin/docker-compose exec export bash
