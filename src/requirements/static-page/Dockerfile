FROM alpine:3.17

RUN apk add --no-cache nodejs npm

WORKDIR /app

RUN apk add ruby-jekyll git
RUN gem install bundler jekyll

RUN git clone https://github.com/tsjensen/fuse-core.git core

WORKDIR /app/core

RUN gem install bundle
COPY conf/_config.yml /app/core/
COPY conf/background.jpg /app/core/images

HEALTHCHECK --interval=15s --timeout=10s --start-period=60s \
  CMD wget -qO- http://localhost:4000 >/dev/null || exit 1

ENTRYPOINT ["jekyll", "serve", "--host=0.0.0.0"]