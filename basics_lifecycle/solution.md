## Managing the Container Lifecycle

#### Manage the lifecycle of a container that runs an Apache HTTP server.

* image to use - quay.io/fedora/httpd-24-micro

### 1. Create a container that runs an Apache HTTP server in the background.
* Execute the podman run command to create the container. Expose the 8080 port
  and use the above mentioned image.
```bash
podman run --name httpd -d -p 8080:8080 quay.io/fedora/httpd-24-micro
```
### 2. Verify that the container is running.
* Run ps command.
```bash
podman ps 
```

* Use the podman inspect command to get the Status field, which indicates
  whether the container is running.
```bash
podman inspect --format='{{.State.Status}}' httpd
```

* Verify that the container is running by using the Running field.
```bash
podman inspect --format='{{.State.Running}}' httpd
```

### 3. Stop the container.
```bash
podman stop httpd
```
### 4. Restart the container.
```bash
podman restart httpd
podman ps
```
### 5. Remove the container.
```bash
podman rm httpd --force
```
### 6. Verify the container has been removed.
```bash
podman ps -a
podman inspect --format='{{.State.Running}}' httpd
```