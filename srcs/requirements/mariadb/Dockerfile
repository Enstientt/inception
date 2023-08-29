# Use the Debian Bullseye base image
FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Change the MySQL configuration to allow remote connections
RUN sed -i '28s/.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script into the container
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

# Expose port 3306 for MySQL
EXPOSE 3306

# Create the socket directory and ensure permissions
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Start MariaDB as the primary process and execute the script
#CMD /usr/sbin/mysqld --user=mysql --socket=/run/mysqld/mysqld.sock & sleep 5 && /script.sh
CMD ["mysqld", "--user=mysql", "--socket=/run/mysqld/mysqld.sock"]