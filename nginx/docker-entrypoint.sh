#!/usr/bin/env sh
set -eu

envsubst '${NGINX_HOST}' < /tmp/nginx/default.conf > /etc/nginx/conf.d/default.conf

exec "$@"