# cmp-3-docker.md

# Overview

[doc](https://docs.docker.com/get-started/overview/)

Docker is an open platform for developing, shipping, and running applicat.ions.  

Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.  

## The Docker platform

Docker provides the ability to package and run an application in a loosely **isolated environment** called a container.  

Containers are lightweight and contain everything needed to run the application, so you don't need to rely  
on what's installed on the host.

## What can I use Docker for?

### Fast, consistent delivery of your applications

Consider the following example scenario:

- Your developers write code locally and share their work with their colleagues using Docker containers.
- They use Docker to push their applications into a test environment and run automated and manual tests.
- When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.


### Responsive deployment and scaling

- Docker's container-based platform allows **for highly portable workloads**.  
  Docker containers can run on a developer's local laptop, on physical or virtual machines in a data center, on cloud providers, or in a mixture of environments.

- Docker's portability and lightweight nature also make it easy to **dynamically manage workloads**.  
  scaling up or tearing down applications and services as business needs dictate, in near real time.

### Running more workloads on the same hardware

Docker is lightweight and fast. It provides a viable, cost-effective alternative to hypervisor-based virtual machines,


## Docker architecture

Docker uses a client-server architecture.  

The Docker client talks to the **Docker daemon**, which does the heavy lifting of building, running, and distributing your Docker containers. 

The Docker client and daemon communicate using a REST API, over **UNIX sockets or a network interface**.

![alt](https://docs.docker.com/get-started/images/docker-architecture.webp)

### The Docker daemon
The Docker daemon (dockerd) **listens for** Docker API requests and **manages** Docker objects such as images, containers, networks, and volumes.  
A daemon can also **communicate with** other daemons to manage Docker services.

### The Docker client
The Docker client (docker) is the primary way that many Docker users interact with Docker.  

When you use commands such as **docker run**, the client sends these commands to dockerd, which carries them out.  
The docker command uses the **Docker API**. The Docker client can communicate with more than one daemon.

### Docker Desktop

### Docker registries
A Docker registry stores Docker images. 

### Docker objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects.

#### Images

An image is a read-only template with instructions for creating a Docker container.

To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed  
to create the image and run it.

#### Containers

A container is a runnable instance of an image.  
You can create, start, stop, move, or delete a container using **the Docker API or CLI**.
