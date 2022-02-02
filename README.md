# Nextcloud (Docker Compose)
Build a Nextcloud instance in Docker Compose complete with PostgreSQL, Redis and SSL

## Prerequisites

1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)
3. SSL key and cert

## Setup

1. Create a copy of `.env.example`:

```bash
cp .env.example .env
```

2. Replace the `SSL_CERT_PATH` and `SSL_KEY_PATH` variables in the newly created `.env` file to point to your SSL key and cert

3. Replace the `NGINX_HOST` variable with your desired domain

4. Replace `VOLUME_PATH` variable if you wish to change where volume data is stored

5. Modify other variables as needed

6. Create the required secrets files (you should consider restricting access to these files):

```bash
# Postgres
echo "SuperSecretPassword" > secrets/postgres_password.txt # Replace with your own super secret password

# Nextcloud
echo "admin" > secrets/nextcloud_admin_user.txt                   # Replace with desired admin username
echo "SuperSecretPassword" > secrets/nextcloud_admin_password.txt # Replace with super secret password for admin Nextcloud user
```

7. Bring up the containers!

```bash
sudo docker-compose -p nextcloud up --build -d
```

8. (Optional) To enable some file previews copy [previews.config.php](nextcloud/previews.config.php) into your Nextcloud's `config` directory (replace `$volume` with the path you have set in the `VOLUME_PATH` environment variable):

```bash
sudo cp nextcloud/previews.config.php $volume/var/www/html/config/
sudo chown www-data:root $volume/var/www/html/config/
```
