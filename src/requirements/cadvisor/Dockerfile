FROM alpine:3.17

RUN apk --no-cache add ca-certificates

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 -O /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor

ENTRYPOINT ["/usr/bin/cadvisor", "--port=8080"]
