## Building and running the application

Your application is configured to be built with Maven. Every Maven-configured project contains a pom.xml file, which defines the project configuration, dependencies, plug-ins, and so on.


Navigate to the start directory where your pom.xml file is located. Your pom.xml file is configured to include the liberty-maven-plugin, which allows you to install applications into Open Liberty as well as manage the server instances.

`cd guide-getting-started/start`{{execute}}

Install and run the server

`mvn install liberty:run`{{execute}}

The mvn command initiates a Maven build, during which the target directory is created to store all build-related files.

The install argument specifies the Maven install phase. During this phase, the application is built and packaged into a .war file, an Open Liberty server runtime is downloaded and installed into the target/liberty/wlp directory, a server instance is created and configured in the target/liberty/wlp/usr/servers/GettingStartedServer directory, and the application is installed into that server via loose config.

The liberty:run argument specifies the Open Liberty run-server goal, which starts an Open Liberty server instance in the foreground.

For more information on the Liberty Maven plug-in, see its GitHub repository.

When the server begins starting up, various messages display in your active shell. Wait for the following message, which indicates that the server startup is complete:

`The server GettingStartedServer is ready to run a smarter planet.`

To access the `system` microservice, access the service endpoint to cause some application measurements to be recorded: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/system/properties"> http://localhost:9080/system/properties</a>.


`{`
    `"os.name": "Mac OS X",`
    `"java.version": "1.8.0_151",`
    `...`
`}`


 Later, when you need to stop the server, simply press `CTRL+C` in the shell session where you ran the server. 
 Do not stop the server yet.


Open up a new terminal window



