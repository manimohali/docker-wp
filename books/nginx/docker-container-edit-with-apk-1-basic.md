The `apk` package manager is used by Alpine Linux, which is known for its small size and simplicity. Docker images based on Alpine Linux use `apk` for package management. These images typically have `alpine` in their name.

### Examples of Alpine-based Docker Images

- **Nginx**:
  ```dockerfile
  FROM nginx:alpine
  ```

- **Node.js**:
  ```dockerfile
  FROM node:alpine
  ```

- **Python**:
  ```dockerfile
  FROM python:alpine
  ```

### Basic Usage of `apk`

Here are some common `apk` commands:

- **Update the Package Index**:
  ```sh
  apk update
  ```

- **Install a Package**:
  ```sh
  apk add <package_name>
  ```

- **Remove a Package**:
  ```sh
  apk del <package_name>
  ```

### Example Dockerfile Using Alpine

Here is an example of a simple Dockerfile using the `nginx:alpine` image:

```dockerfile
# Use the official Nginx image based on Alpine
FROM nginx:alpine

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
```

### Entering an Alpine-based Container

To enter a running Alpine-based container and use `apk`, you can do the following:

1. **Find the Container ID or Name**:
   ```sh
   docker ps
   ```

2. **Enter the Container**:
   ```sh
   docker exec -it <container_id_or_name> sh
   ```

3. **Use `apk` to Install or Manage Packages**:
   ```sh
   apk update
   apk add nano
   ```

By using Alpine-based images, you can benefit from their small size and efficiency, making them ideal for lightweight containers.