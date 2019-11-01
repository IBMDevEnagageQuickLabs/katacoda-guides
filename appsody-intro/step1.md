## Developing Cloud-native applications - Appsody

We are going to start by trying out the developer experience Appsody provides

The Appsody command-line tool (CLI) enables the rapid development of cloud native applications. Let’s take a look at what Appsody provides in terms of capabilities:

`appsody`{{execute}}

You should see a list of available commands. The majority of these commands are for working with stacks: build, debug, run, stop, test, and extract, list.

Let’s take a look at what stacks we have available by entering:

`appsody list`{{execute}}

You’ll see that with the stacks available, we can develop new cloud-native applications using Java, Node.js or Swift, with a number of different, popular frameworks. You can also register new repositories containing stacks created from the ground up or as forks of the default stacks shipped with Appsody

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

Now lets see if the default repository is kabenaro

`appsody repo list`{{execute}}

<pre>

NAME      	URL
*kabanero 	https://github.com/kabanero-io/collections/releases/download/v0.2.0-beta1/kabanero-index.yaml
appsodyhub	https://github.com/appsody/stacks/releases/latest/download/incubator-index.yaml

</pre>
