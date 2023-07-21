FROM alpine:3.17

RUN apk add --no-cache redis

HEALTHCHECK --interval=10s --timeout=3s --retries=3 --start-period=60s CMD redis-cli ping

ENTRYPOINT [ "redis-server", "--protected-mode no" ]