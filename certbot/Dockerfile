FROM certbot/certbot
ENV TZ America/Los_Angeles
COPY entrypoint.sh /usr/local/bin
RUN apk add --no-cache tzdata \
    && addgroup -S certbot -g 1001 \
    && adduser -s /sbin/nologin -u 1001 -S certbot -G certbot \
    && mkdir -p /var/log/letsencrypt \
    && chown -R certbot:certbot /var/lib/letsencrypt \
    && chown -R certbot:certbot /var/log/letsencrypt
USER certbot
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
