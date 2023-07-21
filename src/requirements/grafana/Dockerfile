FROM alpine:3.17

RUN apk update && apk add --no-cache grafana

COPY /conf/grafana.ini /etc/grafana/grafana.ini

HEALTHCHECK --interval=10s --timeout=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/api/health >/dev/null || exit 1

ENTRYPOINT ["grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]
