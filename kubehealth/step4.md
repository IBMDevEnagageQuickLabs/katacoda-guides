## Test out the readiness Probe

The unhealthy deployment should automatically recover after about 1 minute. Run the following command until you see the `READY` state return to `1/1`.

`kubectl get pods`{{execute}}

Once it has recovered you are going to make both demo pods unhealthy by making a POST request to each deployment.

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

`curl -X POST http://$IP:31000/api/name/unhealthy`{{execute}}

 If the response from the second request has the same pod name as the first, wait 5 seconds and run the command again. This is because the readiness probe has not noticed the microservice has become unhealthy.

 Now check that both pods are no longer in a ready state:

 `kubectl get pods`{{execute}}

 You should soon notice that the ping microservice has also changed state. This is because the readiness probe for that pod has realized the demo pod is no longer receiving requests and as such the ping microservice no longer works.

 After a small amount of time, if you keep running the previous command you will notice the demo pods recover and change state to ready. Following this, the ping microservice will also become available after a short amount of time.
