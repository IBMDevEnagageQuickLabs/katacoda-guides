## A look at MicroProfile

MicroProfile is a set of industry specifications for developing Cloud-native applications. At its foundation are a small number of Java EE specifications; JAX-RS, CDI and JSON-P, which are then augmented with technologies addressing the needs of Cloud-native applications.

The tutorial code shows example use of MicroProfile Health and Metrics.

### MicroProfile Health

When you started Open Liberty, it wrote out a number of available endpoints. One of those is the health endpoint for the application: 

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health">http://localhost:9080/health</a>

The MicroProfile health for this application has an overall "outcome" which is determined by the outcome of any available individual health "checks". If any of those checks are "DOWN" then the overall outcome is considered to be "DOWN".

As well as returning a JSON description of the health outcome, the health endpoint also reflects the outcome in the http response code. An outcome of "UP" returns a 200 OK, whereas an outcome of "DOWN" returns a 503 Service Unavailable. This means the endpoint can be hooked up to Kubernetes liveness or readiness probes to reflect the service availability.

The tutorial application health has one "check". This is implemented in 
`/open-cloud-native-intro/src/main/java/my/demo/health/GreetingReadinessCheck.java`{{open}}

MicroProfile supports two types of health checks: readiness and liveness. These match the health checks supported by deployment environments like Kubernetes and, indeed, the MicroProfile Health APIs have been designed to integrate perfectly and Kubernetes liveness and readiness probes.

A readiness check will typically check the availability of resources the service requires in order to correctly function (e.g. services it depends on, database connections, etc). The tutorial application has a simple example readiness check which just returns true because this service does not have any other dependencies.

You can implement many checks as part of your service and their outcomes are aggregated at the `/health/ready` endpoint:

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/ready">http://localhost:9080/health/ready</a>

Liveness checks are aggregated at `/health/live`. You'll see there's a default `/health/live` endpoint that always reports as UP:

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health/live">http://localhost:9080/health/live</a>

All checks are aggregated at `/health`:

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health">http://localhost:9080/health</a>


#### MicroProfile Metrics

When you started Open Liberty it wrote out an endpoint for MicroProfile Metrics: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/metrics/">http://localhost:9080/metrics/</a>. If you tried to access the endpoint you will have found that it requires security configuration to work.  The Metrics endpoint is only available over https and, by default, also requires an authorized user in order to prevent disclosing potentially sensitive information.

The MicroProfile Metrics feature allows you to turn off the security requirements.  This makes it easier to test out Metrics, but is not intended for production systems.

Edit the source server configuration: 
`/open-cloud-native-intro/src/main/liberty/config/server.xml`{{open}}

and add the following line:

`<mpMetrics authentication="false" />`{{copy}}

Rebuild and start the server by typing `ctrl` + `C` in to the terminal and then running the following command: 

`mvn package liberty:run`{{execute}}

Now when you access the metrics endpoint you will be able to access it over http and not be asked to authenticate: 

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/metrics/">http://localhost:9080/metrics/</a>.

The MicroProfile system metrics, for example, JVM heap, cpu, and garbage collection information, don't require any additional coding - they're produced automatically from the JVM.  The metrics data is in <a href="https://prometheus.io">Prometheus</a> format, the default for MicroProfile.  Using an `Accept` header on the request, you can also receive json format (not show in this tutorial).

The tutorial application also shows a MicroProfile application metric in the microservice implementation: 

`/open-cloud-native-intro/src/main/java/my/demo/GreetingService.java`{{open}}

The `@Timed` annotation is an example of one of a number of MicroProfile metric types.  This metric produces timing information for the execution of the `sayHello` service method.  Other metrics include counting method access to measure load, or gauges for custom measurement. 

Access the service endpoint to cause some application measurements to be recorded: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice/greeting/hello/John%20Doe">http://localhost:9080/mpservice/greeting/hello/John%20Doe</a>.

These measurement will be available at the `/metrics` endpoint, but you can also just see the applications metrics at: <a href="https://[[HOST_SUBDOMAIN]]-9443-[[KATACODA_HOST]].environments.katacoda.com/metrics/application">https://localhost:9443/metrics/application</a>.

#### MicroProfile Config

Externalizing configuration is one of the key tenets of <a href="https://12factor.net/">12-factor applications</a>. Externalizing everything that varies between deployments into configuration means you can build once and deploy in the many stages of your DEvOps pipeline, thus removing the risk of your application changing between deployments and invalidating previous testing.  

The tutorial application has also included the use of MicroProfile Config for injecting a configuration property using `@ConfigProperty`.  Open Liberty supports a number of `config sources`.  The tutorial shows the use of Open Liberty `bootstrap.properties`.  

Line 98 of the`/open-cloud-native-intro/pom.xml`{{open}} file contains the configuration for the greeting. The maven build puts this value in: `/open-cloud-native-intro/target/ilberty/wlp/usr/servers/mpserviceServer/bootstrap.properites`{{open}}

This file is read at server startup and the value injected into the `GreetingService` bean when it is created.
Edit the `/open-cloud-native-intro/pom.xml`{{open}} by replacing line 98 to change the greeting to `Bonjour`.

`<greetingServiceGreeting>Bonjour</greetingServiceGreeting>`{{copy}}

Stop the server by typing `ctrl` + `C` in to the terminal.

Start it again: 
`mvn liberty:run`{{execute}}

*Note: if you trigger a rebuild, the integration test will fail as it's expecting the response message to be "Hello". However, the server will still build and run.*

Call the service again to see the greeting change: <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice/greeting/hello/John%20Doe">http://localhost:9080/mpservice/greeting/hello/John%20Doe</a>

This example shows static config injection, where the configuration is read at server start-up.  MicroProfile and Open Liberty also support dynamic configuration injection which means the configuration is re-read periodically (e.g. every 500ms) and so does not require a server restart.

#### MicroProfile OpenAPI

When you started Open Liberty it wrote out two endpoints for MicroProfile OpenAPI. Clicking on the first link displays a machine-readable yaml description of the service, the format of which is defined by the <a href="https://www.openapis.org/">OpenAPI Initiative</a>.

This yaml form of the API can be used by API Gateways or generators for clients to work with your service - for example, to generate client code to call your service.  A number of generators are available for a variety of languages:


<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/openapi/">http://localhost:9080/openapi/</a> and 

The second link is to a web page that gives a human-readable representation of the API and also allows you to browse and call the API.  

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/openapi/ui/">http://localhost:9080/openapi/ui/</a>.  

The machine-readable and Web page API descriptions are created automatically from the JAX-RS definition with no additional work required.  As a result, the information provided for your service is pretty basic.  One of the things MicroProfile OpenAPI provides is a number of annotations to enable you to provide better API documentation.

Edit the `/open-cloud-native-intro/src/main/java/my/demo/GreetingService.java`{{open}} to add documentation for the operation using the `@Operation` annotation after line 44:

`@Operation(summary = "Get a greeting", description = "Returns a greeting for the provided name.")`{{copy}}

You'll also need to add the package import for the annotation on line 25:

`import org.eclipse.microprofile.openapi.annotations.Operation;`{{copy}}

Re-run your build and start the server by entering 'ctrl' + 'C' in to the terminal and:

`mvn compile liberty:run`{{execute}}

Browse the OpenAPI endpoint <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/openapi/">http://localhost:9080/openapi/</a>

You'll see that your API now has additional documentation:

```yaml
...
  /greeting/hello/{name}:
    get:
      summary: Get a greeting
      description: Returns a greeting for the provided name.
      operationId: sayHello
      parameters:
...
```

Stop the server by entering `ctrl` + `C` in to the terminal. 

There are additional annotations available to help you document the parameters and more.

#### Further Reading

MicroProfile has many other important capabilities, such as a type-safe REST client, and fault tolerance (the ability to gracefully handle failures in service dependencies).  Visit the <a href="https://openliberty.io/guides/?search=MicroProfile&key=tag">Open Liberty MicroProfile Guides</a> for more details and deeper dives into what we've covered here.
