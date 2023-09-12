# Use Debian Bullseye as the base image
FROM debian:bullseye

# Install Nginx and OpenSSL
RUN apt-get update
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception_crt.crt \
    -keyout /etc/nginx/ssl/inception_key.key \
    -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=zessadqu.42.fr/UID=zessadqu"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Expose ports for HTTP and HTTPS
EXPOSE 443


# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
