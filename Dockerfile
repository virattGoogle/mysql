# cat Dockerfile
FROM mysql:latest


RUN chown -R mysql:root /var/lib/mysql/


ENV MYSQL_DATABASE=my_db_name
ENV MYSQL_USER=vr
ENV MYSQL_PASSWORD=password1!   
ENV MYSQL_ROOT_PASSWORD=password1!

ADD data.sql /etc/mysql/data.sql

RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/data.sql
RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d

EXPOSE 3306