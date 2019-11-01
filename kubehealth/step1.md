## Deploy Java microservices

Let's begin by ensuring your Kubernetes environment is set up by running. MiniKube will be set up in around about a minute once you see the following message in the terminal `Done! Thank you for using minikube!`. Now run the following command to double check MiniKube is deployed:

`kubectl version`{{execute}}

If the command returns the versions of your kubectl client and cluster, the environment is configured.  Otherwise, repeat the previous command until the command returns the versions.

Now that you have your Kubernetes cluster up and running, you can deploy your microservices using the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}

While you are waiting for your services to start up, take a look at the provided kubernetes.yaml file that you have used to deploy your two Java microservices, by issuing the command below:

`cat kubernetes.yaml`{{execute}}

Here you can see configuration for two deployments and two services. The first deployment `name-deployment` has two replicas which means it will have two pods running. We also specify the Docker image name and the container ports we would like to map outside the container, `9080`. This deployment contains a simple Java microservice that displays a brief greeting and the name of the container it runs in.

The second deployment `ping-deployment` does not specify any replicas as we only require one pod for this tutorial. This deployment pings the Kubernetes service that encapsulates the pod running the name microservice. This demonstrates how communication can be established between pods in your cluster.

For each deployment, you can find information relating to the readiness probe, provided by Kubernetes, underneath the ‘readinessProbe’ attribute. We have specified a delay of 15 seconds that will give the deployment sufficient time to start up. The polling period is set to 5 seconds so it will check the pods health every 5 seconds and if it gets one bad request it will mark that pod as unhealthy.

The Kubernetes readiness probes in these services are implemented using MicroProfile health. The two Docker images that are being used for this tutorial have classes annotated with `@Health` that are integrated with CDI. Run the following command to have a look inside one of the classes used in this tutorial. This is just a simple class that contains a method `setUnhealthy()` that will make the service unhealthy for 60 seconds that allows the tutorial to demonstrate how useful this can be with Kubernetes. Once you have run the following command and had a look at the code behind the service please move on to the next step.

`cat guide-kubernetes-microprofile-health/finish/system/src/main/java/io/openliberty/guides/system/SystemReadinessCheck.java`{{execute}}
