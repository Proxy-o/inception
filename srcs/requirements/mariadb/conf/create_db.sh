#!/bin/sh


if [ ! -d "/var/lib/mysql/mysql" ]; then
    
    chown -R mysql:mysql /var/lib/mysql

  
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

    
    tfile=$(mktemp)
    if [ ! -f "$tfile" ]; then
        exit 1  
    fi
fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    cat /tmp/create_db.sql.template | \
        sed -e "s|\${DB_ROOT}|$DB_ROOT|g" \
            -e "s|\${DB_NAME}|$DB_NAME|g" \
            -e "s|\${DB_USER}|$DB_USER|g" \
            -e "s|\${DB_PASS}|$DB_PASS|g" \
        > /tmp/create_db.sql

    /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
    rm -f /tmp/create_db.sql /tmp/create_db.sql.template
fi

