## Accessing Containers

Use the podman exec and podman cp commands to debug and correct container
configuration.

### Task 1: Create a new container with the following parameters
* Container name: nginx
* Container image: quay.io/redhattraining/podman-nginx-helloworld

### Task 2: Verify localhost:8080 on browser.
* In a web browser, navigate to localhost:8080. You are presented with a 404 Not
Found error page.

### Task 3: Troubleshoot the issue.

* Use the podman cp command to copy the /var/log/nginx/error.log log file in
  the nginx container to your local machine.
  In your terminal, execute the following command:

* Check nginx.conf file on /etc/nginx/nginx.conf for root path.
* On the path mentioned run ls command to check files.
* Check path /usr/share/nginx/html to see if files are present.

### Step 4 - Correct the server configuration.

* Copy nginx.conf file from /etc/nginx/ path
* Edit file, change root value to correct path
* Copy modified file back in pod

### Step 5 - Verify the functionality of the running container.

* Reload the server configuration.
* In a web browser, navigate to localhost:8080. You are presented with the
  index.html page contents.