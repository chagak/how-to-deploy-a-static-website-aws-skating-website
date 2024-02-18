# Use the official Nginx image from Docker Hub
FROM nginx

# Copy custom configuration file (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy static content (HTML, CSS, JS, etc.) into the Nginx default serving directory
# For example, if you have a directory named "static" in the same directory as this Dockerfile,
# you can copy its contents into the Nginx default serving directory as shown below:
COPY . /usr/share/nginx/html

# Expose ports
EXPOSE 80
EXPOSE 443

# By default, Nginx is launched by the base image CMD, no need to explicitly specify here

