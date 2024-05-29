The error message indicates that Nginx is unable to find the `default.conf` file in the `/etc/nginx/sites-enabled/` directory. Given that you updated the filenames, let's ensure that the updated paths and filenames are correctly mounted and available within the container.

### Steps to Debug and Fix the Issue

1. **Verify Host Paths and Files**
   Ensure that the renamed files exist on the host:
   ```sh
   ls -l ./server/nginx/sites-available/default.conf
   ls -l ./server/nginx/sites-enabled/default.conf
   ```

2. **Check Docker Compose File for Correct Paths**
   Make sure your Docker Compose file is correctly referencing the updated paths. Here is an example:
   ```yaml
   version: '3'
   services:
     nginx:
       image: nginx:latest
       volumes:
         - './nginx.conf:/etc/nginx/nginx.conf'
         - './server/nginx/sites-available:/etc/nginx/sites-available'
         - './server/nginx/sites-enabled:/etc/nginx/sites-enabled'
         - './server/nginx/conf.d:/etc/nginx/conf.d'
         - './docker-entrypoint.d/init.sh:/docker-entrypoint.d/init.sh'
         - './server/nginx/ssl:/etc/nginx/ssl'
       ports:
         - '443:443'
   ```

3. **Ensure Correct File Permissions**
   Make sure Docker can read the files:
   ```sh
   chmod +r ./server/nginx/sites-available/default.conf
   chmod +r ./server/nginx/sites-enabled/default.conf
   ```

4. **Recreate Containers**
   Stop and remove any existing containers, then recreate them:
   ```sh
   docker-compose down
   docker-compose up -d
   ```

5. **Verify File Presence Inside Container**
   After starting the container, check if the files are correctly mounted inside the container:
   ```sh
   docker exec -it <container_id> ls -l /etc/nginx/sites-enabled
   docker exec -it <container_id> ls -l /etc/nginx/sites-available
   ```
   Replace `<container_id>` with the actual ID of your Nginx container.

### Example Debugging Session
Here’s an example session to follow these steps:

1. **Check if files exist on the host:**
   ```sh
   ls -l ./server/nginx/sites-available/default.conf
   ls -l ./server/nginx/sites-enabled/default.conf
   ```

2. **Verify permissions:**
   ```sh
   chmod +r ./server/nginx/sites-available/default.conf
   chmod +r ./server/nginx/sites-enabled/default.conf
   ```

3. **Stop and remove existing containers:**
   ```sh
   docker-compose down
   ```

4. **Start containers again:**
   ```sh
   docker-compose up -d
   ```

5. **Check the files inside the container:**
   ```sh
   docker ps
   docker exec -it <container_id> ls -l /etc/nginx/sites-enabled
   docker exec -it <container_id> ls -l /etc/nginx/sites-available
   ```

### Some times `sites-available` Symlinks causes errors 

Note: Instead off creating symlink add copy of the files to the  `sites-available`