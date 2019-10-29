### Containerization (Docker)

Docker has rapidly become the containerization technology of choice for deploying cloud-native applications. All major cloud vendors support Docker, including IBM Cloud and IBM Cloud Private. 

The tutorial includes a Dockerfile for building a docker image for the Microservice.  This Dockerfile is based on the Open Liberty docker image from Docker Hub and adds in the project's server configuration and application from an Open Liberty 'usr server package'.  A usr server package only contains an application and server configuration and is designed to be unzipped over an existing Open Liberty installation (such as the one on the Liberty Docker image).  The advantage of this approach over putting a 'fat jar' (an option supported by Liberty as well as Spring Boot) which contains a lot of infrastructure code, in a docker container, is Docker will cache the pre-req infrastructure layers (e.g. Open Liberty, Java, etc) which makes building and deploying much faster.

#### Build a usr server package

By default the `pom.xml` builds a 'fat jar': `target/mpservice.jar` so we need to build a different package that only includes the server configuration and application (not the server runtime) - a `usr` server package.

The project's maven pom file includes a maven profile for building a usr package, which isn't built by default.  Build the usr server package with: 

`mvn -P usr-package install`{{execute}}

This results in a server zip package:

`target/defaultServer.zip`{{open}}

In the `usr-package` build we also use the name `defaultServer` for the server because this is the name of the server the base Liberty Docker images automatically runs when the container is started.

#### Build and run in Docker

In the directory where the `Dockerfile` is located run: 

`docker build -t my-demo:mpservice .`{{execute}}

Run the docker image: `docker run -p 9080:9080 -p 9443:9443 my-demo:mpservice`{{execute}}

Because the service is running in docker you need to access it on 127.0.0.1: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice/greeting/hello/John%20Doe">http://127.0.0.1:9080/mpservice/greeting/hello/John%20Doe</a>

Note: the `open-liberty` image referenced in the Dockerfile is based on IBM Java (built on Open J9) because we wanted to re-use the official Open Liberty Docker image. Creating an image based on Open J9 would be relatively straightforward.
