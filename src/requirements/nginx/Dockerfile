FROM alpine:3.17

RUN apk update && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/generatessl.sh /

RUN chmod +x /generatessl.sh
RUN ./generatessl.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
