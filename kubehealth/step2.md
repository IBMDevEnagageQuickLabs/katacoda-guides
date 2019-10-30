## Make requests to the microservices

Issue the following command to check the health of your pods:

`kubectl get pods`{{execute}}

The microservices are fully deployed and ready for requests when the `READY` column indicates `1/1` for each deployment.  Repeat the previous command until all deployments are ready before continuing.

Now that your microservices are deployed and running, you are ready to send some requests.

Firstly check the IP address of your Kubernetes cluster by running the following command:

`minikube ip`{{execute}}

You need to set the variable IP to the IP address of your Kubernetes cluster by running the following command:

`IP=$(minikube ip)`{{execute}}

When you run the following command it will use the IP address of your cluster.

`curl http://$IP:31000/api/name`{{execute}}

You should see a response similar to the following:

**Hello! I'm container [container name]**

Similarly, navigate to `curl http://$IP:32000/api/ping/name-service`{{execute}} and observe a response with the content pong.
