To edit a file inside a running Docker container, you can follow these steps:

1. **Enter the Container**: Use the `docker exec` command to start a shell session inside the container.

2. **Edit the File**: Once inside the container, you can use a text editor like `vi`, `nano`, or `vim` to edit the file.

### Step-by-Step Guide

1. **Find the Container ID or Name**:
   First, list all running containers to get the container ID or name:
   ```sh
   docker ps
   ```

   Example output:
   ```
   CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS                    NAMES
   d1b6fa6d21b2   nginx:alpine      "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes   0.0.0.0:8080->80/tcp     test-pacific-nginx-1
   ```

   In this example, the container name is `test-pacific-nginx-1`.

2. **Enter the Container**:
   Use the `docker exec` command to open a shell inside the container:
   ```sh
   docker exec -it test-pacific-nginx-1 sh
   ```
   Replace `test-pacific-nginx-1` with your container's name or ID.

3. **Edit the File**:
   Inside the container, use a text editor to edit the file. For example, if you want to edit `/etc/nginx/nginx.conf`:
   
   - If `vi` is available (common in Alpine-based images):
     ```sh
     vi /etc/nginx/nginx.conf
     ```

   - If `nano` is available (you may need to install it first):
     ```sh
     apk add nano
     nano /etc/nginx/nginx.conf
     ```

### Example of Editing with `vi`:

1. **Open the File with `vi`**:
   ```sh
   vi /etc/nginx/nginx.conf
   ```

2. **Edit the File**:
   - Press `i` to enter insert mode.
   - Make your changes.

3. **Save and Exit**:
   - Press `Esc` to exit insert mode.
   - Type `:wq` and press `Enter` to save the changes and exit `vi`.

### Example of Installing and Using `nano` (if not already installed):

1. **Install `nano`**:
   ```sh
   apk add nano
   ```

2. **Open the File with `nano`**:
   ```sh
   nano /etc/nginx/nginx.conf
   ```

3. **Edit the File**:
   - Make your changes directly in `nano`.

4. **Save and Exit**:
   - Press `Ctrl + O` to save the changes.
   - Press `Enter` to confirm.
   - Press `Ctrl + X` to exit `nano`.

### Exit the Container Shell
Once you are done editing, you can exit the container shell by typing:
```sh
exit
```

This will return you to your host machine's shell.

By following these steps, you can edit files inside a running Docker container.