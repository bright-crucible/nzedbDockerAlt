FROM znc:slim

ENV TZ America/Los_Angeles
RUN apk --no-cache add shadow \
    && usermod -u 1001 znc \
    && groupmod -g 1001 znc
