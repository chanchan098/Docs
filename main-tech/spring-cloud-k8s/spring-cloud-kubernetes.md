# Spring cloud kubernetes

https://docs.spring.io/spring-cloud-kubernetes/reference/index.html

## Resources

- [spring on k8s](https://hackmd.io/@ryanjbaxter/spring-on-k8s-workshop#Spring-on-Kubernetes)
  
- [k8s with feign client](https://peterconrey.medium.com/spring-boot-microservice-communication-on-kubernetes-with-feign-clients-69e2cb267c35)

https://piotrminkowski.com/2019/12/20/microservices-with-spring-cloud-kubernetes/

https://piotrminkowski.com/2022/06/01/https-on-kubernetes-with-spring-boot-istio-and-cert-manager/

### istio

https://github1s.com/istio/istio/blob/master/samples/bookinfo/src/productpage/productpage.py

https://piotrminkowski.com/2020/06/01/service-mesh-on-kubernetes-with-istio-and-spring-boot/

### Configmap

https://piotrminkowski.com/2023/06/08/spring-cloud-kubernetes-with-spring-boot-3/

## Tutorial-complex

### TODO improvements

- from ingress to gateway Api.
- remove RibbonClient, get gateway instead.

**`mvn install` in docker build, no in system**

https://spring.academy/guides/kubernetes-app-enhancements-spring-k8s#build-spring-applications

https://github.com/AndriyKalashnykov/spring-microservices-k8s

[use config map](https://stackoverflow.com/questions/75668043/how-do-i-load-properties-from-a-kubernetes-configmap-into-my-spring-boot-applica)

### setting proxy to `docker build` in `Dockerfile`

https://github.com/GoogleContainerTools/jib/issues/1403

restricted to the executor in single line, no operating system

`RUN MAVEN_OPTS="-Dhttp.proxyHost=192.168.0.116 -Dhttp.proxyPort=10809 -Dhttps.proxyHost=192.168.0.116 -Dhttps.proxyPort=10809" mvn dependency:go-offline`

### Simple steps

0. build images from sources.
1. import images from `docker` to `crictl` or push it to registry then `pull`.
2. to modify the keys `image` and `imagePullPolicy` within `.yaml`, if needed.
3. to grant permission of the core api to application.
4. to create preparation resources, like Role, ConfigMap, Secret etc.
5. run the deployment yaml.
6. checking out state.
7. populating data.
8. retrieving data.

## Tutorial-no-discovery

- [tutorial](https://www.baeldung.com/spring-cloud-kubernetes)

### prerequisites

- 2 linux node at least
- kubeadm cluster 
- docker 
- git
- java 9 or above & maven 
- proxy
  
### git (work node)

git clone https://github.com/eugenp/tutorials.git


### build project

setting maven proxy at `/usr/share/maven/conf/settings.xml`

`cd` to `project-root/spring-cloud-modules/spring-cloud-kubernetes/kubernetes-guide`

`mvn install`

### docker build

- local registry setting up
  - proxy problem, addresses at local network need to be ignored
- move image from docker to containerd

### run on k8s


## Spring Cloud Kubernetes Configuration Watcher


## Spring Cloud Kubernetes Discovery Server

