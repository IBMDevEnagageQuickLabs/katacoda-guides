## Running the application in a Docker container

To run the application in a container, you need to have Docker installed. For installation instructions, see the Official Docker Docs.

To containerize the application, you need a `Dockerfile`. This file contains a collection of instructions that define how a Docker image is built, what files are packaged into it, what commands run when the image runs as a container, and so on. You can find a complete `Dockerfile` in the `start` directory. This `Dockerfile` packages the `usr` server package into a Docker image that contains a preconfigured Open Liberty server.

Change directories to build the docker containers:

`cd ..`{{execute}}

To build and containerize the application, start your Docker daemon and run the following command:

`docker build -t openliberty-getting-started:1.0-SNAPSHOT .`{{execute}}

The `-t` flag in the `docker build` command allows the Docker image to be labeled (tagged) in the `name[:tag]` format. The tag for an image describes the specific image version. If the optional `[:tag]` tag is not specified, the `latest` tag is created by default. The Docker openliberty-getting-started:1.0-SNAPSHOT image is built from the `Dockerfile`. To verify that the image is built, run the `docker images` command to list all local Docker images:

`docker images`{{execute}}

Your image should appear in the list of all Docker images:

<pre>

REPOSITORY                     TAG             IMAGE ID        CREATED         SIZE
openliberty-getting-started    1.0-SNAPSHOT    85085141269b    21 hours ago    487MB

</pre>

Next, run the image as a container:

`docker run -d --name gettingstarted-app -p 9080:9080 openliberty-getting-started:1.0-SNAPSHOT`{{execute}}

There is a bit going on here, so let’s break down the command:

<pre>
Flag	Description
-d
Runs the container in the background.
--name
Specifies a name for the container.
-p
Maps the container ports to the host ports.
</pre>


The final argument in the docker run command is the Docker image name.
Next, run the docker ps command to verify that your container started:

`docker ps`{{execute}}

<pre>
Make sure that your container is running and does not have Exited as its status:
CONTAINER ID    IMAGE                         CREATED          STATUS           NAMES
4294a6bdf41b    openliberty-getting-started   9 seconds ago    Up 11 seconds    gettingstarted-app
</pre>

To access the application, visit the http://localhost:9080/system/properties URL.

To stop and remove the container, run the following commands:

`docker stop gettingstarted-app && docker rm gettingstarted-app`{{execute}}

To remove the image, run the following command:

`docker rmi openliberty-getting-started:1.0-SNAPSHOT`{{execute}}
