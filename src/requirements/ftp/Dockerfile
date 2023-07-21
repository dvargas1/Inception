FROM alpine:3.17

RUN apk add --no-cache --update \
	vsftpd==3.0.5-r2

COPY /conf/vsftpd.conf /etc
COPY tools/ftp_entrypoint.sh /

RUN chmod 777 ./ftp_entrypoint.sh

ENTRYPOINT [ "/ftp_entrypoint.sh" ]