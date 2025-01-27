FROM debian:buster

#PACKAGES
RUN apt-get update
RUN apt-get install mariadb-server mariadb-client vim -y

#CONF FILES MARIADB
RUN sed -i 's/= mysql/= root/g' /etc/mysql/mariadb.conf.d/50-server.cnf 
RUN sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf 
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf 

#DIRECTORY NEEDED BY MYSQL SOCKET
RUN mkdir /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

EXPOSE 3306

WORKDIR /var/run
COPY entry.sh .

ENTRYPOINT ["/var/run/entry.sh"]
CMD ["mysqld_safe"]
