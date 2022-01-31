FROM nginx:latest

COPY default.conf /tmp/nginx/default.conf

COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod 755 /tmp/docker-entrypoint.sh
ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]