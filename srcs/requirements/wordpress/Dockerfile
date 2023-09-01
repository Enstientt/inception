# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y curl mariadb-client php-mysql php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the .conf in the html directory
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start

# Copy the script into the container
COPY ./tools/script.sh /



# Make the script executable
RUN chmod +x /script.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Run the script when the container starts
CMD ["./script.sh"]
