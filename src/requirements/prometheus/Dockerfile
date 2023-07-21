FROM alpine:3.17

RUN apk --no-cache add prometheus

COPY /conf/prometheus.yml /etc/prometheus/

EXPOSE 9090

ENTRYPOINT ["prometheus", "--config.file=/etc/prometheus/prometheus.yml"]