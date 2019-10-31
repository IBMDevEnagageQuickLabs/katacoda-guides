## Build a cloud-native microservice

Navigate in to the project directory that has been provided for you. This contains a pre-build microservice for you to study and extend. 

`cd open-cloud-native-intro`{{execute}}

Build and run the microservice application:

`mvn liberty:dev`{{execute}}

The goal, dev, invokes the create, install-feature, and deploy goals before starting the server. Note: This goal is designed to be executed directly from the Maven command line. To exit dev mode, press `Control`-`C`, or type `q` and press Enter.

Dev mode provides three key features. Code changes are detected, recompiled, and picked up by your running server. Unit and integration tests are run on demand when you press Enter in the command terminal where dev mode is running, or optionally on every code change to give you instant feedback on the status of your code. Finally, it allows you to attach a debugger to the running server at any time to step through your code.

To see what the app does, open a web browser at the following URL: 
<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice">http://localhost:9080/mpservice</a>

This displays a simple web page that provides a link to the microservice. On that page, click on the link to the greeting service. This will call the microservice URL: 

<a href="https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/mpservice/greeting/hello/John%20Doe">http://localhost:9080/mpservice/mpservice/greeting/hello/John%20Doe</a>
