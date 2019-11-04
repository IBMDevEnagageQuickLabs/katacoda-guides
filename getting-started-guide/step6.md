## Running the application from a minimal runnable JAR

So far, Open Liberty has been running out of the `target/liberty/wlp` directory, which effectively contains an Open Liberty server installation and the deployed application. The final product of the Maven build is a server package for use in a continuous integration pipeline and, ultimately, a production deployment.


Open Liberty supports a number of different server packages. The sample application currently generates a `usr` package that contains the servers and application to be extracted onto an Open Liberty installation.

Instead of creating a server package, you can generate a runnable JAR file that contains the application along with a server runtime. This JAR file can then be run anywhere and deploy your application and server at the same time. To generate a runnable JAR file, override the `include` property:

`mvn liberty:package -Dinclude=runnable`{{execute}}

The packaging type is overridden from the `usr` package to the `runnable` package. This property then propagates to the `liberty-maven-plugin` plug-in, which generates the server package based on the `openliberty-kernel` package.

When the build completes, you can find the minimal runnable guide-getting-started.jar file in the `target` directory. This JAR file contains only the features that you explicitly enabled in your server.xml file. As a result, the generated JAR file is only about 50 MB.
To run the JAR file, first stop the server if it’s running. Then, navigate to the `target` directory and run the `java -jar` command:

`cd target`{{execute}}

`java -jar guide-getting-started.jar`{{execute}}

When the server starts, visit the <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/system/properties">http://localhost:9080/system/properties</a> URL to access your application that is now running out of the minimal runnable JAR.

At this point, you can stop the server by pressing `CTRL+C` in the shell session that the server runs in.
