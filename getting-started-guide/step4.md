## Checking the Open Liberty server logs

While the server is running in the foreground, it displays various console messages in the shell. These messages are also logged to the `target/liberty/wlp/usr/servers/GettingStartedServer/logs/console.log` file. 
You can find the complete server logs in the  `target/liberty/wlp/usr/servers/GettingStartedServer/logs` directory. The `console.log` and `messages.log` files are the primary log files that contain console output of the running application and the server. More logs are created when run time errors occur or whenever tracing is enabled. You can find the error logs in the `ffdc` directory and the tracing logs in the trace.log file.


In addition to the log files that are generated automatically, you can enable logging of specific Java packages or classes by using the `<logging/>` element:

```
<logging traceSpecification="<component_1>=<level>:<component_2>=<level>:..."/>
```

The `component` element is a Java package or class, and the `level` element is one of the following logging levels: `off`, `fatal`, `severe`, `warning`, `audit`, `info`, `config`, `detail`, `fine`, `finer`, `finest`, `all`.

Try enabling detailed logging of the MicroProfile Health feature by adding the `<logging/>` element to your configuration file:

`src/main/liberty/config/server.xml`{{open}}

`<logging traceSpecification="com.ibm.ws.microprofile.health.*=all" />`{{copy}}

Wait until you see the following message in the terminal:
`[INFO] [AUDIT   ] CWWKG0017I: The server configuration was successfully updated in 0.499 seconds.`

Now, when you visit the `/health` endpoint, additional traces are logged into the `trace.log` file.

