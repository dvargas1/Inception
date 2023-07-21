FROM debian:bullseye

RUN apt update \
&& apt install -y mariadb-server

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/database

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create-db.sh /bin

HEALTHCHECK --interval=10s --timeout=3s \
  CMD mysqladmin ping -u root || exit 1

ENTRYPOINT ["sh", "/bin/create-db.sh"]