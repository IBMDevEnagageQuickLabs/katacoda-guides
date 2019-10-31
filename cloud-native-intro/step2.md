## Build a cloud-native microservice

Navigate in to the project directory that has been provided for you. This contains a pre-build microservice for you to study and extend. 

`cd open-cloud-native-intro`{{execute}}

Build and run the microservice application:

`mvn liberty:dev`{{execute}}

Building the application (`mvn install`) also downloads Open Liberty from Maven Central and installs it to `target/liberty`. The build also packages the application in the `target` directory in a WAR file, called `mpservice.war` and creates a minimal runnable jar containing Open Liberty and the application, called `mpservice.jar`. The `liberty:run` command (Maven goal) starts the `mpserviceServer` server in the `target/liberty` directory.

Note: you will see some warnings from the server relating to SSL configuration. These are expected and will be addressed later.

To see what the app does, open a web browser at the following URL: 
<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice">http://localhost:9080/mpservice</a>

This displays a simple web page that provides a link to the microservice. On that page, click on the link to the greeting service. This will call the microservice URL: 

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice/greeting/hello/John%20Doe">http://localhost:9080/mpservice/mpservice/greeting/hello/John%20Doe</a>
