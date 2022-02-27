# Nextcloud (Docker Compose)
Build a Nextcloud instance in Docker Compose complete with PostgreSQL and Redis

## Prerequisites

1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)
3. A reverse proxy on its own Docker network

## Setup

1. Create a copy of `.env.example`:

```bash
cp .env.example .env
```

2. Replace the `NEXTCLOUD_HOST` variable with your desired domain

3. Replace `VOLUME_PATH` variable if you wish to change where volume data is stored

4. Modify other variables as needed

5. Create the following required secrets files (you should consider restricting access to these files):

- `secrets/postgres_password.txt`
- `secrets/nextcloud_admin_user.txt`
- `secrets/nextcloud_admin_password.txt`

```bash
# Postgres
echo "SuperSecretPassword" > secrets/postgres_password.txt # Replace with your own super secret password

# Nextcloud
echo "admin" > secrets/nextcloud_admin_user.txt                   # Replace with desired admin username
echo "SuperSecretPassword" > secrets/nextcloud_admin_password.txt # Replace with super secret password for admin Nextcloud user
```

6. Bring up the containers!

```bash
sudo docker-compose -p nextcloud up --build -d
```

7. (Optional) To enable some file previews copy [previews.config.php](nextcloud/previews.config.php) into your Nextcloud's `config` directory (replace `$volume` with the path you have set in the `VOLUME_PATH` environment variable):

```bash
sudo cp nextcloud/previews.config.php $volume/var/www/html/config/
sudo chown www-data:root $volume/var/www/html/config/previews.config.php
```
