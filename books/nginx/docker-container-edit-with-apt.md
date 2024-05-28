If you have `apt` available instead of `apk`, it means your container is likely based on a Debian or Ubuntu image. Here’s how you can edit files inside the container using `apt` to install necessary editors.

### Step-by-Step Guide

1. **Enter the Container**:
   Use the `docker exec` command to start a shell session inside the container. Replace `your_container_name_or_id` with your container's name or ID.

   ```sh
   docker exec -it your_container_name_or_id bash
   ```

2. **Update Package List**:
   Update the package list to ensure you can install the latest versions of packages.

   ```sh
   apt update
   ```

3. **Install a Text Editor**:
   Install a text editor like `nano` or `vim`. Here’s how to install each:

   - **Install `nano`**:
     ```sh
     apt install nano -y
     ```

   - **Install `vim`**:
     ```sh
     apt install vim -y
     ```

4. **Edit the File**:
   Use the installed text editor to edit your file. For example, to edit `/etc/nginx/nginx.conf`:

   - **Using `nano`**:
     ```sh
     nano /etc/nginx/nginx.conf
     ```

   - **Using `vim`**:
     ```sh
     vim /etc/nginx/nginx.conf
     ```

### Example of Editing with `nano`:

1. **Open the File with `nano**:
   ```sh
   nano /etc/nginx/nginx.conf
   ```

2. **Edit the File**:
   - Make your changes directly in `nano`.

3. **Save and Exit**:
   - Press `Ctrl + O` to save the changes.
   - Press `Enter` to confirm.
   - Press `Ctrl + X` to exit `nano`.

### Example of Editing with `vim`:

1. **Open the File with `vim`**:
   ```sh
   vim /etc/nginx/nginx.conf
   ```

2. **Edit the File**:
   - Press `i` to enter insert mode.
   - Make your changes.

3. **Save and Exit**:
   - Press `Esc` to exit insert mode.
   - Type `:wq` and press `Enter` to save the changes and exit `vim`.

### Exit the Container Shell
Once you are done editing, exit the container shell by typing:
```sh
exit
```

This will return you to your host machine's shell.

By following these steps, you can successfully edit files inside a running Docker container using `apt` to install and use text editors like `nano` or `vim`.