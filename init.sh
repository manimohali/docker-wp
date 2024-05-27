#!/bin/sh

# Create directories if they do not exist
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled

# Start NGINX
nginx -g "daemon off;"
