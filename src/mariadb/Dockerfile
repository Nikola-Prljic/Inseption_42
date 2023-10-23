FROM debian:bullseye

#RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

RUN rm -rf /var/lib/apt/lists/*; 

ENV LANG C.UTF-8

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

#RUN chmod 777 /var/run/mysqld/mysqld.sock

COPY setup_db.sh /usr/local/bin/setup_db.sh

RUN chmod 777 /usr/local/bin/setup_db.sh
#COPY ./tools/initial_db.sql /var/www/
#RUN mysql_secure_installation

#CMD ["/etc/init.d/mysql start"]

#RUN mysql_secure_installation

ENTRYPOINT ["/usr/local/bin/setup_db.sh"]


EXPOSE 3306
#RUN mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

CMD ["mysqld", "--bind-address=0.0.0.0"]