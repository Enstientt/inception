# Use Debian Bullseye as the base image
FROM debian:bullseye

# Install Nginx and OpenSSL
RUN apt update
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception_crt.crt \
    -keyout /etc/nginx/ssl/inception_key.key \
    -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=zessadqu.42.fr/UID=zessadqu"

# Copy Nginx configuration and SSL certificate generation script
# COPY /conf/nginx.conf /etc/nginx/conf.d/nginx.conf
# COPY /tools/generate_ssl_cert.sh /tools/generate_ssl_cert.sh
# COPY /index.html /var/www/html/index.nginx-debian.html
COPY ./conf/nginx.conf .

# Expose ports for HTTP and HTTPS
EXPOSE 443


# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
