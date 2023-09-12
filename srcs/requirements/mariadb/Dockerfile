# Use the Debian Bullseye base image
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 3306

CMD ["./script.sh"]
