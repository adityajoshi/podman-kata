#! /bin/bash

podman stop times-app cities-app
podman rm times-app cities-app
podman rmi localhost/podman-cities-app:v0.1 localhost/podman-times-app:v0.1
podman network rm cities
