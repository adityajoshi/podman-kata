### Basics Exposing

This exercise uses two applications: times and cities. The times application returns the
current time of a given city, and the cities application returns information about a specific
city. 

To fetch the current time of the city, the cities application fetches data from the times
application.

### Step 1 - Examine the source code of the applications.

* Navigate to podman-info-times
* Examine Containerfile for the times app.
* Navigate to podman-info-cities
* Examine Containerfile for the cities app.


### Step 2 - Create a Podman network with DNS enabled.

* Observe that DNS is disabled in the default Podman network.

```Bash
podman network inspect podman
```

* Create a network by using the podman network create command.

```Bash
podman network create cities
```

* Inspect the cities network to verify that DNS is enabled.

```Bash
podman network inspect cities
```

### Step 3 - Start and test the times application attached to the cities network.

* Create a container for the times application that forwards port 8080 from the
  container to the host. Attach the container to the cities network.

```Bash
podman build -t podman-info-cities:v0.1 -f podman-info-cities/Containerfile

podman run --name cities-app --network cities -p 8080:8080 \ 
-d podman-info-times:v0.1
```

* Inspect the times-app container to find its private IP within the Podman network
   and copy the IP address.

```Bash
podman inspect times-app \
-f '{{.NetworkSettings.Networks.cities.IPAddress}}'
```

* Use the private IP address to make a request to the /times API endpoint from
  another container. Run the curl command inside a ubi-minimal container to fetch
  the current time for Bangkok, which has the code BKK. Attach the container to the
  cities network. Replace IP_ADDRESS with the IP address from the previous step.

```bash
podman run --rm --network cities registry.access.redhat.com/ubi8/ubi-minimal \
curl -s http://IP_ADDRESS:8080/times/BKK && echo
```

* Use the DNS name to make a request to the /times API endpoint from another
container.

```bash
podman run --rm --network cities registry.access.redhat.com/ubi8/ubi-minimal \
curl -s http://times-app:8080/times/BKK && echo
```

### Step 4 - Start and test the cities application attached to the cities network.


* Create a container called cities-app and start the application on port 8090. Attach
  the container to the cities network.
  Set the TIMES_APP_URL environment variable to the URL of the times application.
  Notice that the URL uses the name of the times-app container.

```bash
podman build -t podman-info-cities:v0.1 -f podman-info-cities/Containerfile

podman run --name cities-app \
--network cities -p 8090:8090 -d \
-e TIMES_APP_URL=http://times-app:8080/times \
localhost/podman-info-cities:v0.1
```

* Fetch the city information of Madrid by using the MAD city code.

```bash
curl -s http://localhost:8090/cities/MAD | jq
```

* Fetch the city information of San Diego by using the SAN city code.

```bash
curl -s http://localhost:8090/cities/SAN | jq
```