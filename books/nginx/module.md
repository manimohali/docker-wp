To manage NGINX modules, you generally have two approaches: dynamic modules and statically compiled modules. Below, I will explain how to list, verify, install, delete, update, and reinstall modules for NGINX.

### Listing All Available Modules

To list all available modules in your NGINX installation, you can use the `nginx -V` command. This will display the configuration parameters, including all the compiled modules.

```sh
nginx -V 2>&1 | grep -o -- '--with-http_[a-z_]\+_module'
```

For dynamic modules, you can check the configuration file (usually located at `/etc/nginx/nginx.conf`) for `load_module` directives.

### Verifying a Module

To verify if a specific module is installed and loaded, check the NGINX configuration file for the `load_module` directive.

For example, to check if the `ngx_http_geoip_module` is loaded, look for:

```nginx
load_module modules/ngx_http_geoip_module.so;
```

Additionally, you can verify it by running `nginx -V` and checking the output for the module.

### Installing a Module

To install a module, you typically need to:

1. **Dynamic Module**:
   - Find the appropriate `.so` file for the module.
   - Modify the NGINX configuration to load the module.

For example, to install a dynamic module:

```sh
# Download the module if not available
sudo apt-get install nginx-module-geoip

# Load the module in nginx.conf
load_module modules/ngx_http_geoip_module.so;
```

2. **Static Module**:
   - Recompile NGINX with the module.

For example:

```sh
# Download the NGINX source code and the module source code
wget http://nginx.org/download/nginx-1.18.0.tar.gz
tar -xzvf nginx-1.18.0.tar.gz
cd nginx-1.18.0

# Configure and compile NGINX with the new module
./configure --with-http_geoip_module
make
sudo make install
```

### Deleting a Module

1. **Dynamic Module**:
   - Remove the `load_module` directive from the configuration file.
   - Optionally, delete the `.so` file from the modules directory.

2. **Static Module**:
   - You need to recompile NGINX without the module.

For dynamic modules:

```sh
# Remove the load_module directive
# load_module modules/ngx_http_geoip_module.so;
```

For static modules:

```sh
# Reconfigure and recompile NGINX without the module
./configure
make
sudo make install
```

### Updating a Module

To update a dynamic module:

1. **Dynamic Module**:
   - Replace the old `.so` file with the new version.
   - Reload or restart NGINX.

For example:

```sh
# Download and install the updated module
sudo apt-get update
sudo apt-get install --only-upgrade nginx-module-geoip

# Reload NGINX to apply changes
sudo systemctl reload nginx
```

2. **Static Module**:
   - Recompile NGINX with the updated module.

```sh
# Reconfigure and recompile NGINX with the updated module
./configure --with-http_geoip_module
make
sudo make install
```

### Reinstalling a Module

1. **Dynamic Module**:
   - Remove the module and install it again.

```sh
# Remove the module
sudo apt-get remove nginx-module-geoip

# Install the module again
sudo apt-get install nginx-module-geoip

# Reload NGINX
sudo systemctl reload nginx
```

2. **Static Module**:
   - Recompile NGINX with the module again.

```sh
# Reconfigure and recompile NGINX with the module
./configure --with-http_geoip_module
make
sudo make install
```

### Example Configuration File (`nginx.conf`)

Here's an example `nginx.conf` file to load a dynamic module:

```nginx
user  nginx;
worker_processes  1;

load_module modules/ngx_http_geoip_module.so;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

This configuration demonstrates how to load the `ngx_http_geoip_module` as a dynamic module. Make sure to adapt the configuration to your specific requirements.