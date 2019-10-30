## Deploying your changes

You now need rebuild and redeploy the applications for your changes to take effect. Rebuild the application using the following commands, making sure you're in the `start` directory:

`mvn package -pl system`{{execute}}

`mvn package -pl inventory`{{execute}}

Now you need to delete your old Kubernetes deployment then deploy your updated deployment by issuing the following commands:

`kubectl delete -f kubernetes.yaml`{{execute}}

`kubectl apply -f kubernetes.yaml`{{execute}}

You should see the following output from the commands:

`
$ kubectl delete -f kubernetes.yaml
deployment.apps "system-deployment" deleted
deployment.apps "inventory-deployment" deleted
service "system-service" deleted
service "inventory-service" deleted
$ kubectl apply -f kubernetes.yaml
deployment.apps/system-deployment created
deployment.apps/inventory-deployment created
service/system-service created
service/inventory-service created
`

Check the status of the pods for the services with:

`kubectl get --watch pods`{{execute}}

You should eventually see the status of **Ready** for the two services. Press `Ctrl-C` to exit the terminal command. 

Call the updated system service and check the headers using the curl command:


`curl -u bob:bobpwd -D - http://$IP:31000/system/properties -o /dev/null`{{execute}}

You should see that the response `X-App-Name` header has changed from `system` to `my-system`​.

Verify that inventory service is now using the Kubernetes Secret for the credentials by making the following curl request:

`curl http://$IP:32000/inventory/systems/system-service`{{execute}}

If the request fails, check you've configured the Secret correctly.
