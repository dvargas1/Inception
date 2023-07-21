FROM alpine:3.17

WORKDIR /app

RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    libffi-dev \
    openssl-dev

RUN pip3 install --no-cache-dir Flask==2.1.1 redis==4.5.2

COPY conf/app.py .
COPY conf/templates templates/
COPY conf/static static/

HEALTHCHECK --interval=10s --timeout=10s --start-period=60s \
  CMD wget -qO- http://localhost:5000 >/dev/null || exit 1

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]