## Accessing Containers

Use the podman exec and podman cp commands to debug and correct container
configuration.

### Task 1: Create a new container with the following parameters
* Container name: nginx
* Container image: quay.io/redhattraining/podman-nginx-helloworld

```Bash
podman pull quay.io/redhattraining/podman-nginx-helloworld
podman run --name nginx -d -p 8080:8080 quay.io/redhattraining/podman-nginx-helloworld
```

### Task 2: Verify localhost:8080 on browser.
In a web browser, navigate to localhost:8080. You are presented with a 404 Not
Found error page.

### Task 3: Troubleshoot the issue.

* Use the podman cp command to copy the /var/log/nginx/error.log log file in
  the nginx container to your local machine.
  In your terminal, execute the following command:
```Bash
podman cp nginx:/var/log/nginx/error.log error.log
```
  Check log file. 

  Note - It's possible that it is empty.

* Check nginx.conf file on /etc/nginx/nginx.conf for root path.
* On the path mentioned run ls command to check files.
```bash
podman exec ls /usr/share/nginx/html/public
```
* Check path /usr/share/nginx/html to see if files are present.
```bash
podman exec ls /usr/share/nginx/html/
```

### Step 4 - Correct the server configuration.

* Copy nginx.conf file from /etc/nginx/ path
```bash
podman exec cp /etc/nginx/nginx.conf .
```
* Edit file, change root value to /usr/share/nginx/html
```bash
old root /usr/share/nginx/html/public
new root /usr/share/nginx/html/
```
* Copy modified file back in pod
```bash
podman exec cp nginx.conf /etc/nginx
```

### Step 5 - Verify the functionality of the running container.

* Reload the server configuration.
```bash
podman exec nginx nginx -s reload
```

* In a web browser, navigate to localhost:8080. You are presented with the
  index.html page contents.