FROM nginx

RUN groupadd -g 1001 appuser && \
  useradd -r -u 1001 -g appuser appuser && \
  mkdir -p /opt/nginx/log && \
  chown -R appuser:appuser /opt/nginx && \
  mkdir -p /var/cache/nginx && \
  chown -R appuser:appuser /var/cache/nginx && \
  mkdir -p /app && \
  chown -R appuser:appuser /app

WORKDIR /opt/nginx

COPY --chown=appuser:appuser ./nginx_data/www/hello-world.html /app/hello-world.html
COPY --chown=appuser:appuser ./nginx_data/config/nginx.conf ./nginx.conf
COPY --chown=appuser:appuser ./nginx_data/config/mime.types ./mime.types

EXPOSE 8000

USER appuser

CMD ["nginx", "-c", "/opt/nginx/nginx.conf", "-g", "daemon off;"]

