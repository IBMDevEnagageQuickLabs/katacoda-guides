## Developing Cloud-native applications - Appsody

We are going to start by trying out the developer experience Appsody provides

Let’s take a look at what Appsody provides in terms of capabilities. In a command prompt, type:

`appsody`{{execute}}

You should see output similar to the following:

The Appsody command-line tool (CLI) enables the rapid development of cloud native applications.


<pre>
Usage:
  appsody [command]

Available Commands:
  build       Locally build a docker image of your appsody project
  completion  Generates bash tab completions
  debug       Run the local Appsody environment in debug mode
  deploy      Build and deploy your Appsody project to your Kubernetes cluster
  extract     Extract the stack and your Appsody project to a local directory
  help        Help about any command
  init        Initialize an Appsody project with a stack and template app
  list        List the Appsody stacks available to init
  operator    Install or uninstall the Appsody operator from your Kubernetes cluster.
  repo        Manage your Appsody repositories
  run         Run the local Appsody environment for your project
  stop        Stops the local Appsody docker container for your project
  test        Test your project in the local Appsody environment
  version     Show Appsody CLI version

Flags:
      --config string   config file (default is $HOME/.appsody/.appsody.yaml)
      --dryrun          Turns on dry run mode
  -h, --help            help for appsody
  -v, --verbose         Turns on debug output and logging to a file in $HOME/.appsody/logs

Use "appsody [command] --help" for more information about a command.

</pre>

The Appsody CLI has a number of Commands. The majority of these commands are for working with stacks: build, debug, run stop, test, and extract, list.

Let’s take a look at what stacks we have available by entering:

`appsody list`{{execute}}

This command lists the available stacks and you should see something like:

<pre>

REPO                    ID                          VERSION     TEMPLATES   DESCRIPTION
appsodyhub              java-microprofile           0.2.11      *default    Eclipse MicroProfile using OpenJ9 and Maven
appsodyhub              java-spring-boot2           0.3.8       *default    Spring Boot using OpenJ9 and Maven
appsodyhub              nodejs                      0.2.5       *simple     Runtime for Node.js applications
appsodyhub              nodejs-express              0.2.5       *simple     Express web framework for Node.js
appsodyhub              nodejs-loopback             0.1.3       *scaffold   LoopBack API framework for Node.js
appsodyhub              swift                       0.1.4       *simple     Runtime for Swift applications

</pre>


You’ll see that with the stacks available, we can develop new cloud-native applications using Java, Node.js or Swift, with a number of different, popular frameworks.


You can also register new repositories containing stacks created from the ground up or as forks of the default stacks shipped with Appsody


To illustrate that point, we can register the repository for Kabanero collections, using the following command:

`appsody repo add kabanero https://github.com/kabanero-io/collections/releases/download/v0.2.0-beta1/kabanero-index.yaml`{{execute}}

`appsody repo list`{{execute}}

You should see an output similar to this:


<pre>

NAME               URL
*appsodyhub        https://github.com/appsody/stacks/releases/latest/download/incubator-index.yaml
kabanero           https://github.com/kabanero-io/collections/releases/download/v0.2.0-beta1/kabanero-index.yaml

</pre>


`Appsodyhub` is the location where the appsody project releases its stacks. The `*` indicates that this is the default repository. We can instruct appsody to set the new kabanero repository as the default repository:

`appsody repo set-default kabanero`{{execute}}

The following output will be displayed:

`Your default repository is now set to kabanero`

Now lets see if the default repository is kabenaro

`appsody repo list`{{execute}}

<pre>

NAME      	URL
*kabanero 	https://github.com/kabanero-io/collections/releases/download/v0.2.0-beta1/kabanero-index.yaml
appsodyhub	https://github.com/appsody/stacks/releases/latest/download/incubator-index.yaml

</pre>