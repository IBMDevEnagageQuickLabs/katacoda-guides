## Running the application from a minimal runnable JAR

So far, Open Liberty has been running out of the `target/liberty/wlp` directory, which effectively contains an Open Liberty server installation and the deployed application. The final product of the Maven build is a server package for use in a continuous integration pipeline and, ultimately, a production deployment.


Open Liberty supports a number of different server packages. The sample application currently generates a usr package that contains the servers and application to be extracted onto an Open Liberty installation.


The type of server package is configured with `<packaging.type/>` in the `pom.xml`.

Instead of creating a server package, you can generate a runnable JAR file that contains the application along with a server runtime. This JAR can then be run anywhere and deploy your application and server at the same time. To generate a runnable JAR, invoke the `runnable-package` profile by using the `-P` flag:

`mvn install -P runnable-package`{{execute}}

The `-P` flag specifies the Maven profile to be run during the build. In this case, the `runnable-package` profile is invoked, which temporarily overrides the `packaging.type` property from the usr package to the runnable package. This property then propagates to the liberty-maven-plugin plug-in, which generates the server package that you want.


When the build completes, you can find the runnable `getting-started.jar` file in the `target` directory. By default, this JAR file comes with all the features available in Open Liberty, including the entirety of Java EE and MicroProfile. As a result, this JAR is over 100 MB. To omit the features that you don’t need and package the JAR with only the `features` that you defined in the `server.xml` file, use `minifiy,runnable` as the packaging type. To build a minimal runnable JAR, invoke the `minify-runnable-package` profile by using the `-P` flag:

`mvn install -P minify-runnable-package`{{execute}}

The `minify-runnable-package` profile overrides the `packaging.type` property from the `usr` package to the `minify,runnable` package and generates a runnable JAR file that contains only the `features` that you explicitly enabled in your `server.xml` file. As a result, the generated JAR is only about 50 MB.

To run the JAR, first stop the server if it’s running. Then, navigate to the `target` directory and run the `java -jar` command:

`cd target`{{execute}}

`java -jar getting-started.jar`{{execute}}

When the server starts, visit the <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/system/properties">http://localhost:9080/system/properties</a> URL to access your application that is now running out of the minimal runnable JAR.

At this point, you can stop the server by pressing `CTRL+C` in the shell session that the server runs in.