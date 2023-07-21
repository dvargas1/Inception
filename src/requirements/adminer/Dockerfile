FROM alpine:3.17

RUN apk --no-cache add wget ca-certificates php php-fpm php-session php-mysqli

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /srv/index.php
RUN chown -R nobody:nobody /srv/index.php
RUN chmod 777 /srv/index.php

WORKDIR /srv

HEALTHCHECK --interval=10s --timeout=10s --start-period=60s \
  CMD wget -qO- http://localhost:80/index.php >/dev/null || exit 1

ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "/srv"]