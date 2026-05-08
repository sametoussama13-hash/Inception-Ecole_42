FROM debian: bookworm

RUN apt update -y && apt install mariadb-server -y

COPY /conf/debian.conf /etc/mysql/mariadb.conf.d/50.server.cnf
COPY /tools/init.sh /init.sh

RUN chmod +x init.sh

CMD ["/init.sh"]