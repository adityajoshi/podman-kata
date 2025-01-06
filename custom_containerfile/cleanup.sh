#! /bin/bash

podman stop httpd_bad httpd_good
podman rm httpd_bad httpd_good
#podman rmi quay.io/fedora/httpd-24-micro