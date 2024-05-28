To configure your NGINX to listen on both ports 80 (HTTP) and 443 (HTTPS) with SSL, you need to update your NGINX configuration to include a server block for HTTPS with the appropriate SSL settings. Here’s how you can do it:

### Step-by-Step Guide

1. **Update Your NGINX Configuration**:
   Modify your NGINX configuration file to include server blocks for both HTTP and HTTPS.

2. **Generate or Obtain SSL Certificates**:
   You need an SSL certificate and a private key. For testing purposes, you can use self-signed certificates, but for production, you should use certificates from a trusted Certificate Authority (CA).

3. **Update Docker Compose File** (if needed):
   Make sure your Docker Compose setup mounts the SSL certificates into the container.

### Example NGINX Configuration

Here’s an updated example of your NGINX configuration that listens on both ports 80 and 443:

```nginx
# HTTP server block
server {
    listen 80;
    listen [::]:80;
    server_name localhost;

    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.ht {
        deny all;
    }

    # Redirect HTTP to HTTPS
    return 301 https://$host$request_uri;
}

# HTTPS server block
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name localhost;

    root /var/www/html;
    index index.php index.html index.htm;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

### SSL Certificates

For testing purposes, you can create a self-signed certificate using OpenSSL:

```sh
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
```

### Update Docker Compose

If you're using Docker Compose, ensure your SSL certificates are mounted correctly. Here’s how you can update your `docker-compose.yml` to include the SSL certificates:

```yaml
version: '3.8'

services:
  wordpress:
    image: wordpress:php8.2-fpm
    restart: always
    volumes:
      - wordpress:/var/www/html
      - /home/ri-13/Desktop/chandramani/docker/test-pacific/wp-content/plugins/my-simple-plugin:/var/www/html/wp-content/plugins/my-simple-plugin
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_CONFIG_EXTRA: |
        /* Multisite */
        define('WP_ALLOW_MULTISITE', true );
        define('MULTISITE', true);
        define('SUBDOMAIN_INSTALL', false);
        define('DOMAIN_CURRENT_SITE', 'localhost');
        define('PATH_CURRENT_SITE', '/');
        define('SITE_ID_CURRENT_SITE', 1);
        define('BLOG_ID_CURRENT_SITE', 1);
    networks:
      - wpsite

  db:
    image: mariadb:10.5
    volumes:
      - db_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
    networks:
      - wpsite

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./server/nginx/sites-available:/etc/nginx/sites-available
      - ./server/nginx/sites-enabled:/etc/nginx/sites-enabled
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - wordpress
    networks:
      - wpsite

networks:
  wpsite:

volumes:
  db_data:
  wordpress:
```

### Explanation

- **nginx.conf**: The NGINX configuration file with HTTP and HTTPS server blocks.
- **SSL Certificates**: Located in the `./ssl` directory and mounted to `/etc/nginx/ssl` in the container.

By following these steps, you will configure your NGINX to listen on both port 80 and 443, with HTTP requests being redirected to HTTPS. Ensure you have the necessary certificates for production use, preferably from a trusted CA.