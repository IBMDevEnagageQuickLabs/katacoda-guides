## Making requests to the microservices

Issue the following command to check the status of your microservices:

`kubectl get --watch pods`{{execute}}

If you see 0/1 beside the status **not ready**, wait a little while and check again. This will change to 1/1 and **Running** when your microservices are ready to receive requests.

Now your microservices are deployed and running with the **Ready** status you are ready to send some requests. Press `Ctrl-C` to exit the terminal command. Your pod currently does not have health checks implemented so even though the above command says **Ready** you application may not be ready to receive requests. Adding health checks is beyond the scope of this tutorial but it is something to keep in mind when using Kubernetes.

Firstly check the IP address of your Kubernetes cluster by running the following command:

`minikube ip`{{execute}}

Now you need to set the environment variable `IP` to the IP address of your Kubernetes cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

Next, you'll use `curl` to make an `HTTP GET` request to the 'system' service. The service is secured with a user id and password that is passed in the request.

`curl -u bob:bobpwd http://$IP:31000/system/properties`{{execute}}

You should see a response that will show you the JVM system properties of the running container.


Similarly, use the following `curl` command to call the inventory service:  

`curl http://$IP:32000/inventory/systems/system-service`{{execute}}

The inventory service will call the system service and store the response data in the inventory service before returning the result.

In this tutorial, you're going to use a Kubernetes ConfigMap to modify the `X-App-Name:` response header. Take a look at their current values by running the following curl command:

`curl -u bob:bobpwd -D - http://$IP:31000/system/properties -o /dev/null`{{execute}}

