FROM public.ecr.aws/docker/library/alpine:3.17.5

ARG DB_NAME \
    DN_ROOT \
    DB_USER \
    DB_PASS  

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

COPY requirements/mariadb/conf/docker.cnf /etc/my.cnf.d/docker.cnf

COPY requirements/mariadb/conf/create_db.sh .

COPY requirements/mariadb/conf/create_db.sql.template /tmp/create_db.sql.template

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

RUN sh create_db.sh && rm create_db.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
