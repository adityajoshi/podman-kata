## Basics Creating

Create several Podman containers by using different options.

### Task 1:
Use the docker.io/redhat/ubi9-minimal image to create a new
container that prints the It Works!!! text.

```Bash
podman pull docker.io/redhat/ubi9-minimal:latest
podman run --rm docker.io/redhat/ubi9-minimal echo "It works!!!"
```

### Task 2:
Explore setting and printing environment variables by using the
docker.io/redhat/ubi9-minimal container image.

```Bash
podman pull docker.io/redhat/ubi9-minimal:latest
podman run --rm -e GREET=Welcome -e NAME=podman docker.io/redhat/ubi9-minimal \
printenv GREET NAME
```
