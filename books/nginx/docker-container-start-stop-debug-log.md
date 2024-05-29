

### 1. Starting a Container
#### `docker start`

- **Description:** Starts a stopped container.
- **Usage:** 
  ```sh
  docker start <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker start my_container
  ```

### 2. Stopping a Container
#### `docker stop`

- **Description:** Stops a running container.
- **Usage:**
  ```sh
  docker stop <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker stop my_container
  ```

### 3. Restarting a Container
#### `docker restart`

- **Description:** Restarts a running or stopped container.
- **Usage:**
  ```sh
  docker restart <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker restart my_container
  ```

### 4. Debugging a Container
#### `docker exec`

- **Description:** Runs a command in a running container.
- **Usage:**
  ```sh
  docker exec -it <container_id_or_name> <command>
  ```
- **Example:** To open a bash shell inside a container:
  ```sh
  docker exec -it my_container /bin/bash
  ```

### 5. Viewing Logs
#### `docker logs`

- **Description:** Fetches the logs of a container.
- **Usage:**
  ```sh
  docker logs <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker logs my_container
  ```
- **Follow logs in real-time:**
  ```sh
  docker logs -f my_container
  ```

### 6. Inspecting Container Details
#### `docker inspect`

- **Description:** Returns low-level information about a container.
- **Usage:**
  ```sh
  docker inspect <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker inspect my_container
  ```

### 7. Listing Containers
#### `docker ps`

- **Description:** Lists running containers.
- **Usage:**
  ```sh
  docker ps
  ```
- **Example:**
  ```sh
  docker ps
  ```
- **List all containers (running and stopped):**
  ```sh
  docker ps -a
  ```

### 8. Removing a Container
#### `docker rm`

- **Description:** Removes a stopped container.
- **Usage:**
  ```sh
  docker rm <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker rm my_container
  ```

### 9. Removing a Container Forcefully
#### `docker rm -f`

- **Description:** Forcefully removes a running container.
- **Usage:**
  ```sh
  docker rm -f <container_id_or_name>
  ```
- **Example:**
  ```sh
  docker rm -f my_container
  ```

### 10. Running a Container in Detached Mode
#### `docker run -d`

- **Description:** Runs a container in the background (detached mode).
- **Usage:**
  ```sh
  docker run -d <image_name>
  ```
- **Example:**
  ```sh
  docker run -d nginx
  ```

### 11. Running a Container with Interactive Terminal
#### `docker run -it`

- **Description:** Runs a container interactively with a terminal.
- **Usage:**
  ```sh
  docker run -it <image_name> <command>
  ```
- **Example:** To run a bash shell in an Ubuntu container:
  ```sh
  docker run -it ubuntu /bin/bash
  ```

### Visual Diagram

Here's a visual summary of these commands:

```
 +---------------+                +---------------+
 |               |                |               |
 |   docker ps   | <--+---------> |  docker ps -a |
 |               |    |           |               |
 +-------+-------+    |           +-------+-------+
         |            |                   |
         v            v                   v
 +-------+-------+    +-------+-------+   +-------+-------+
 |               |    |               |   |               |
 | docker start  |    | docker stop   |   | docker rm     |
 |               |    |               |   |               |
 +-------+-------+    +-------+-------+   +-------+-------+
         |                    |
         v                    v
 +-------+-------+    +-------+-------+
 |               |    |               |
 | docker exec   |    | docker logs   |
 |               |    |               |
 +-------+-------+    +-------+-------+
```

### Summary

1. **Start a container:** `docker start my_container`
2. **Stop a container:** `docker stop my_container`
3. **Restart a container:** `docker restart my_container`
4. **Debug a container:** `docker exec -it my_container /bin/bash`
5. **View logs:** `docker logs my_container`
6. **Inspect container details:** `docker inspect my_container`
7. **List running containers:** `docker ps`
8. **List all containers:** `docker ps -a`
9. **Remove a container:** `docker rm my_container`
10. **Remove a container forcefully:** `docker rm -f my_container`
11. **Run a container in detached mode:** `docker run -d nginx`
12. **Run a container interactively:** `docker run -it ubuntu /bin/bash`

