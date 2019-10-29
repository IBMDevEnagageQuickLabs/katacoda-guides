## Creating a new Project with Appsody

Make a directory to contain your project:

`mkdir -p ~/workspace/kabanero-workshop/nodejs`{{execute}}

Enter the directory where you will be working in:

`cd ~/workspace/kabanero-workshop/nodejs`{{execute}}

Create the new project. This project will be using the Node.JS Express framework.

`appsody init kabanero/nodejs-express`{{execute}}

When the build completes, you should see something like:

<pre>
...
[InitScript] [INFO] ------------------------------------------------------------------------
[InitScript] [INFO] BUILD SUCCESS
[InitScript] [INFO] ------------------------------------------------------------------------
[InitScript] [INFO] Total time: 0.800 s
[InitScript] [INFO] Finished at: 2019-09-02T15:52:41+01:00
[InitScript] [INFO] ------------------------------------------------------------------------
Successfully initialized Appsody project
</pre>

The stack image does not contain APPSODY_PROJECT_DIR. 

`docker run --rm --entrypoint /bin/bash kabanero/nodejs-express:0.2 -c find /project -type f -name .appsody-init.sh`{{execute}}

### Live coding with Appsody

Let’s start the new application ready to make some edits. Enter the following command:

`appsody run`{{execute}}

The run command for this stack has been set up to run the application with node and use hot code updates to reflect code changes made to the source tree.

Let’s now make a code change. The node.js Express stack can dynamically update the running application without needing a restart.

First, navigate to the REST application endpoint to confirm that there are no esources available. Open the following link in your browser:


<a href="https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/resource"> http://localhost:3000/resource</a>

You should see an `Not Found` response.

Open up the app.js file:

`workspace/kabanero-workshop/nodejs/app.js`{{open}}

Insert to modify the app.js source file to include the extra "/resource" REST path:

Copy the following block and add it to app.js
<pre>
app.get('/resource', (req, res) => {
  res.send("Resource from Appsody!");
});
</pre>

You should see that upon saving the file the source code change is detected and the application updated:

Now if you browse <a href="https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/resource"> http://localhost:3000/resource</a> you should see the message: `Resource from Appsody!` instead of the original Not Found message

Try changing the message in app.js saving and refreshing the page. You’ll see it only takes a few seconds for the change to take effect.

Type `Ctrl-C` into the terminal to end the appsody run.



