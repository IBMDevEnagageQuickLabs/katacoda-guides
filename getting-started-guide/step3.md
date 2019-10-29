## Updating the source code without restarting the server

The JAX-RS application that contains your `system` microservice is configured as a loose application, meaning that it runs in a server from its `.class` file and other artifacts. Open Liberty automatically monitors these artifacts, and whenever they are updated, it updates the running server without the need for the server to be restarted.

Navigate to the `pom.xml` file under start directory


The loose application support is enabled with the `<looseApplication/>` element in the `liberty-maven-plugin` plug-in.


Try updating the source code while the server is running. At the moment, the `/health` endpoint reports whether or not the server is running, but the endpoint doesn’t provide any details on the microservices that are running inside of the server.


MicroProfile Health offers health checks for both readiness and liveness. A readiness check allows third-party services, such as Kubernetes, to know if the microservice is ready to process requests. A liveness check allows third-party services to determine if the microservice is running.


### Create the SystemReadinessCheck class.

Head to the directory where the SystemReadinessCheck class will be created

`cd src/main/java/io/openliberty/sample/system`{{execute}}

Create SystemReadinessCheck class

`touch SystemReadinessCheck.java`{{execute}}

Open SystemReadinessCheck.java

`/root/guide-getting-started/start/src/main/java/io/openliberty/sample/system/SystemReadinessCheck.java`{{open}}

Insert code into SystemReadinessCheck class

<pre class="file" data-target="clipboard">
package io.openliberty.sample.system;

import javax.enterprise.context.ApplicationScoped;

import javax.inject.Inject;
import javax.inject.Provider;

import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.health.Readiness;
import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.HealthCheckResponseBuilder;

@Readiness
@ApplicationScoped
public class SystemReadinessCheck implements HealthCheck {

    @Inject
    @ConfigProperty(name = "io_openliberty_guides_system_inMaintenance")
    Provider<String> inMaintenance;

    @Override
    public HealthCheckResponse call() {
        HealthCheckResponseBuilder builder = HealthCheckResponse.named(
                SystemResource.class.getSimpleName() + " readiness check");
        if (inMaintenance != null && inMaintenance.get().equalsIgnoreCase("true")) {
            return builder.withData("services", "not available").down().build();
        }
        return builder.withData("services", "available").up().build();
    }

}
</pre>

The `SystemReadinessCheck` class verifies that the `system` microservice is not in maintenance by checking a config property.

Go to the directory that the `SystemReadinessCheck.java` will be saved

Now we create the SystemLivenessCheck class

Create a new file called `SystemLivenessCheck.java`

`touch SystemLivenessCheck.java`{{execute}}

Open SystemLivenessCheck

Next, recompile the application:

`mvn compile`{{execute}}

The following messages display in your first shell session:

<pre>
[INFO] [AUDIT] CWWKT0017I: Web application removed (default_host): http://foo:9080/
[INFO] [AUDIT] CWWKZ0009I: The application io.openliberty.guides.getting-started has stopped successfully.
[INFO] [AUDIT] CWWKT0016I: Web application available (default_host): http://foo:9080/
[INFO] [AUDIT] CWWKZ0003I: The application io.openliberty.guides.getting-started updated in xx.xx seconds.
</pre>


Access the /health endpoint again by visiting the <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health"> http://localhost:9080/health</a> URL. This time you see the overall status of your server as well as the aggregated data of the liveness and readiness checks for the system microservice: 

<pre>
{
   "checks":[
      {
         "data":{
            "services":"available"
         },
         "name":"SystemResource readiness check",
         "status":"UP"
      },
      {
         "data":{
            "memory used":81064480,
            "memory max":4294967296
         },
         "name":"SystemResource liveness check",
         "status":"UP"
      }
   ],
   "status":"UP"
}
</pre>

You can also access the `/health/ready` endpoint by visiting the <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/ready"> http://localhost:9080/health/ready</a> URL to view the data from the readiness health check. Similarily, access the /health/live endpoint by visiting the<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/live"> http://localhost:9080/health/live</a> URL to view the data from the liveness health check.