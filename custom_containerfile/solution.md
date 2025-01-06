## Create Image with Containerfile

### Create an image from custom container file and copy given test.html file to /var/www/html

* image to use - quay.io/fedora/httpd-24-micro

### Step 1 : Create a Containerfile
```bash
FROM quay.io/fedora/httpd-24-micro
RUN cd /var/www/html
COPY . .
```

### Step 2 : Create image from above file.
```bash
podman build -t httpd:bad .
```

### Step 3 : Run image tree command to check layers
```bash
podman image tree httpd:bad
```

### Step 4 : Modify Containerfile as below
Instead of RUN use WORKDIR. RUN command creates another layer in image.

```bash
FROM quay.io/fedora/httpd-24-micro
WORKDIR /var/www/html
COPY . .
```

### Step 5 : Recreate image
```bash
podman build -t http:good .
```

### Step 6 : Run image tree command to check layers
```bash
podman image tree httpd:good
```

### Step 7 : Run container to see it works
```bash
podman run -d --name http_good -p 8080:8080 http:good
```

### Step 8 : Run browser to check it works