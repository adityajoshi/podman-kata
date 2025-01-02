#! /bin/bash

podman stop httpd
podman rm httpd
#podman rmi quay.io/fedora/httpd-24-micro