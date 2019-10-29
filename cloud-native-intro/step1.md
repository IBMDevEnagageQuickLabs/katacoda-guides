## A look at OpenJ9 and AdoptOpenJDK
Cloud-native is an approach to application development and deployment. It's the product of a number of industry movements over the past 10-15 years - agile development practices, DevOps, Microservices and Cloud. Cloud-native applications are developed using agile practices, use continuous integration/continuous delivery to streamline deployment, are architected around team-aligned microservices, and leverage the cloud for rapid deployment at scale.

OpenJ9 is an Eclipse open source JVM. It resulted from the contribution of IBM's JVM implementation to Eclipse and so has many years of high-volume, high-availability production use behind it. It's low footprint, fast startup and high throughput characteristics make it an ideal choice for cloud-native applications - if you pay for your cloud by memory footprint, this is going to be important to you.

Every JVM needs a class library, and most people don't want to build their own Java distribution. The best place to get a build of OpenJ9 is AdoptOpenJDK. This provides pre-built binaries of the OpenJDK class libraries with different JVMs.

Run the command: 

`which java`{{execute}}

To find out more about the Java you have installed, run: 

`java -version`{{execute}}