# Nextcloud (Docker Compose)
Build a Nextcloud instance in Docker Compose complete with Redis and optional PostgreSQL

## Prerequisites

1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)
3. A reverse proxy on its own Docker network

### <a id="ReverseProxy">Reverse Proxy Docker Network</a>

This Docker Compose file assumes you have a reverse proxy (like Nginx) in a Docker container on another Docker network. If you are not using a reverse proxy or do not wish to use the Docker network to connect the reverse proxy, you can set the `frontend` network's `external` property to be `false` in [docker-compose.yaml](docker-compose.yaml). You may also need to expose the HTTP port (80) on the `nextcloud` service.

## Setup

1. Create a copy of `.env.example`:

```bash
cp .env.example .env
```

2. Replace the `DOCKER_PROXY_NETWORK` variable with the Docker network where your reverse proxy sits (see [Reverse Proxy Docker Network](#ReverseProxy))

3. Replace the `NEXTCLOUD_HOST` variable with your desired domain

4. Replace `VOLUME_PATH` variable if you wish to change where volume data is stored

5. Modify other variables as needed

6. Create the following required secrets files (you should consider restricting access to these files):

- `secrets/postgres_password.txt`
- `secrets/nextcloud_admin_user.txt`
- `secrets/nextcloud_admin_password.txt`

7. Bring up the containers!

```bash
# No PostgreSQL (if you have your own PostgreSQL DB)
sudo docker-compose -p nextcloud up --build -d

# With Dockerized PostgreSQL
sudo docker-compose -f docker-compose.yaml -f docker-compose.db.yaml -p nextcloud up --build -d
```

8. (Optional) To enable some file previews copy [previews.config.php](nextcloud/previews.config.php) into your Nextcloud's `config` directory (replace `$volume` with the path you have set in the `VOLUME_PATH` environment variable):

```bash
sudo cp nextcloud/previews.config.php $volume/var/www/html/config/
sudo chown www-data:root $volume/var/www/html/config/previews.config.php
```
