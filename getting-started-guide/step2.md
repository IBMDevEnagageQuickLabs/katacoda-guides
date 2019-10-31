## Updating the server configuration without restarting the server
Try updating the server configuration while the server is running. The `system` microservice does not currently include health monitoring to report whether the server and the microservice that it runs are healthy. You can add health reports with the MicroProfile Health feature, which adds a `/health` endpoint to your application. If you try to access this endpoint now at the  <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health"> http://localhost:9080/health</a> URL, you see a 404 error because the /health endpoint does not yet exist:

`Error 404: java.io.FileNotFoundException: SRVE0190E: File not found: /health`

Open up the `server.xml` file:

`guide-getting-started/start/src/main/liberty/config/server.xml`{{open}}

and add the MicroProfile Health feature to the server by placing the mpHealth feature tag between the `<feature manager>` tags:

`<feature>mpHealth-2.0</feature>`{{copy}}

When enabled, the `mpHealth` feature automatically adds a `/health` endpoint to the application. You can see the server being updated in the server log that’s displayed in your first shell session:


<pre>
[INFO] [AUDIT] CWWKG0016I: Starting server configuration update.
[INFO] [AUDIT] CWWKT0017I: Web application removed (default_host): http://foo:9080/
[INFO] [AUDIT] CWWKZ0009I: The application io.openliberty.guides.getting-started has stopped successfully.
[INFO] [AUDIT] CWWKG0017I: The server configuration was successfully updated in 0.284 seconds.
[INFO] [AUDIT] CWWKT0016I: Web application available (default_host): http://foo:9080/health/
[INFO] [AUDIT] CWWKF0012I: The server installed the following features: [mpHealth-1.0].
[INFO] [AUDIT] CWWKF0008I: Feature update completed in 0.285 seconds.
[INFO] [AUDIT] CWWKT0016I: Web application available (default_host): http://foo:9080/

<pre>
{
    "checks":[],
    "outcome":"UP"
}
</pre>

You now have a means of verifying if your server is up and running.
