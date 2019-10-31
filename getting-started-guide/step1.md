## Building and running the application

Your application is configured to be built with Maven. Every Maven-configured project contains a `pom.xml` file, which defines the project configuration, dependencies, plug-ins, and so on.


Navigate to the start directory where your `pom.xml` file is located. Your `pom.xml` file is configured to include the `liberty-maven-plugin`, which allows you to install applications into Open Liberty as well as manage the server instances.

`cd guide-getting-started/start`{{execute}}

Install and run the server

`mvn liberty:dev`{{execute}}

The mvn command initiates a Maven build, during which the target directory is created to store all build-related files.

The liberty:devargument specifies the Open Liberty dev goal, which invokes the create, install-feature, and deploy goals before starting the server.

For more information on the Liberty Maven plug-in, see its <a href=https://github.com/OpenLiberty/ci.maven/blob/master/docs/dev.md>GitHub repository</a>.

When the server begins starting up, various messages display in your active shell. Wait for the following message, which indicates that the server startup is complete:

`The defaultServer server is ready to run a smarter planet. The defaultServer server started in x.xxx seconds..”

To access the `system` microservice, access the service endpoint to cause some application measurements to be recorded: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/system/properties"> http://localhost:9080/system/properties</a>.


`{`
    `"os.name": "Mac OS X",`
    `"java.version": "1.8.0_151",`
    `...`
`}`



