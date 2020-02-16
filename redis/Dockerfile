FROM redis:5-alpine

COPY redis.conf /usr/local/etc/redis/redis.conf
RUN apk --no-cache add shadow \
    && usermod -u 1001 redis \
    && groupmod -g 1001 redis \
    && mkdir -p /run/redis \
    && chown redis:redis /run/redis \
    && chmod 755 /run/redis
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
