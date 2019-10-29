## The goal of this interactive guide is to run and update a simple REST microservice on an Open Liberty Server. 

The online terminal is a pre-configured Linux environment. Clicking on the blocks of code and pressing ENTER will execute that command in the terminal.

Open Liberty is an application server designed for the cloud. It’s small, lightweight, and designed with modern cloud-native application development in mind. It supports the full MicroProfile and Java EE APIs and is composable, meaning that you can use only the features that you need, keeping the server lightweight, which is great for microservices. It also deploys to every major cloud platform, including Docker, Kubernetes, and Cloud Foundry.

Maven is an automation build tool that provides an efficient way to develop Java applications. Using Maven, you will build a simple microservice, called system, that collects basic system properties from your laptop and displays them on an endpoint that you can access in your web browser. You will then make server configuration and code changes and see how they are picked up by a running server. You’ll also explore how to package your application with the server runtime so that it can be deployed anywhere in one go.

Finally, you will package the application along with the server configuration into a Docker image and run that image as a container.