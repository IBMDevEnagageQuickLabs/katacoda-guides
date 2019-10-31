## Updating the server configuration without restarting the server
Try updating the server configuration while the server is running. The `system` microservice does not currently include health monitoring to report whether the server and the microservice that it runs are healthy. You can add health reports with the MicroProfile Health feature, which adds a `/health` endpoint to your application. If you try to access this endpoint now at the  <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health"> http://localhost:9080/health</a> URL, you see a 404 error because the `/health` endpoint does not yet exist:

`Error 404: java.io.FileNotFoundException: SRVE0190E: File not found: /health`

Open up the `server.xml` file:

`guide-getting-started/start/src/main/liberty/config/server.xml`{{open}}

and add the MicroProfile Health feature to the server by placing the mpHealth feature tag between the `<feature manager>` tags:

`<feature>mpHealth-2.0</feature>`{{copy}}

When enabled, the `mpHealth` feature automatically adds a `/health` endpoint to the application. You can see the server being updated in the server log:

`[INFO] [AUDIT   ] CWWKZ0003I: The application guide-getting-started updated in x.xxx seconds.`

Now when you navigate to <a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/health"> http://localhost:9080/health</a>, you should see the following:
<pre>
{
    "checks":[],
    "outcome":"UP"
}
</pre>

You now have a means of verifying if your server is up and running.
