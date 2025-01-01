#! /bin/bash

podman stop nginx
podman rm nginx
#podman rmi quay.io/redhattraining/podman-nginx-helloworld