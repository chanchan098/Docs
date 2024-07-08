

- [-Reference](#-reference)
- [API Overview](#api-overview)
- [--API Access Control](#--api-access-control)
- [Using RBAC Authorization](#using-rbac-authorization)
  - [API objects](#api-objects)
    - [Role and ClusterRole](#role-and-clusterrole)
  - [RoleBinding and ClusterRoleBinding](#rolebinding-and-clusterrolebinding)
- [-- Kubernetes API](#---kubernetes-api)
- [Workload Resources](#workload-resources)
  - [Pod](#pod)
  - [PodTemplate](#podtemplate)
  - [ReplicationController](#replicationcontroller)
  - [Deployment](#deployment)
  - [ReplicaSet](#replicaset)
- [Service Resources](#service-resources)
  - [Service](#service)
- [Config and Storage Resources](#config-and-storage-resources)
  - [Volume](#volume)
- [Authentication Resources](#authentication-resources)
  - [ServiceAccount](#serviceaccount)
- [Common Definitions](#common-definitions)
  - [LabelSelector](#labelselector)
  - [ObjectMeta](#objectmeta)
- [-Networking Reference](#-networking-reference)
- [Virtual IPs and Service Proxies](#virtual-ips-and-service-proxies)
- [E-Networking Reference](#e-networking-reference)
- [-- Setup tools](#---setup-tools)
- [Kubeadm](#kubeadm)
- [-- Command line tool (kubectl)](#---command-line-tool-kubectl)
- [-------------------------------------------------](#-------------------------------------------------)
- [Api references](#api-references)

# -Reference


# API Overview

[link](https://kubernetes.io/docs/reference/using-api/)

The REST API is the fundamental fabric of Kubernetes. All operations and communications between components, and  
external user commands are REST API calls that the API Server handles. Consequently, everything in the Kubernetes  
platform is treated as an API object and has a corresponding entry in the API.



# --API Access Control

*Reference/API Access Control*

# Using RBAC Authorization

https://kubernetes.io/docs/reference/access-authn-authz/rbac/

## API objects

### Role and ClusterRole

- Role, has namespace 
- ClusterRole, hasn't namespace 

<span style='font-size: 15px;'>**ClusterRoles uses**</span>  
1. define permissions on namespaced resources and be granted access within individual namespace(s)
2. define permissions on namespaced resources and be granted access across all namespaces
3. define permissions on cluster-scoped resources

---

If you want to define a role within a namespace, use a Role; if you want to define a role cluster-wide, use a ClusterRole.

## RoleBinding and ClusterRoleBinding 

A role binding grants the permissions defined in a role to a user or set of users.





# -- Kubernetes API

# Workload Resources

<https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/>

## Pod

Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts.

- **spec**([PodSpec](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#PodSpec))
  - **containers** ([]Container), required
    - **name**  
    - **image** (string)
    - **imagePullPolicy** (string)(optional)
    - **volumeMounts** ([]VolumeMount)
      - >Pod volumes to mount into the container's filesystem. Cannot be updated.
      - >VolumeMount describes a mounting of a Volume within a container.
        - **mountPath** (string), required
          - >Path within the container at which the volume should be mounted. Must not contain ':'.
        - **name** (string), required
        - **mountPropagation**  (string)
          - >mountPropagation determines how mounts are propagated from the host to container and the other way around.
          - >When not set, MountPropagationNone is used. This field is beta in 1.10.
  - **volumes**
    - >List of volumes that can be mounted by containers belonging to the pod.
    - see also[volume](#volume)
  - **serviceAccountName (string)**
    - >ServiceAccountName is the name of the ServiceAccount to use to run this pod. 
    - >https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/

<span style='font-size: 15px;'>**[example](https://github.com/easegress-io/easegress/blob/main/docs/04.Cloud-Native/4.2.Gateway-API.md#deploy-backend-services)**</span>  
```yaml
spec:
  containers:
  - name: hello-v1
    image: "us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0"
    env:
    - name: "PORT"
      value: "50001"
  - name: hello-v2
    image: "us-docker.pkg.dev/google-samples/containers/gke/hello-app:2.0"
    env:
    - name: "PORT"
      value: "50002"
```

## PodTemplate

PodTemplate describes a template for creating copies of a predefined pod.

- template (PodTemplateSpec)  
    - metadata(ObjectMeta)
    - spec([PodSpec](#pod))

## ReplicationController

ReplicationController represents the configuration of a replication controller.

`spec (ReplicationControllerSpec) > template (PodTemplateSpec)`

## Deployment 

Deployment enables declarative updates for Pods and ReplicaSets.

- **spec** ([DeploymentSpec](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/deployment-v1/#DeploymentSpec)) 
  - **selector** ([LabelSelector](#labelselector)), required
    - >Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels.
  - **template** ([PodTemplateSpec](#podtemplate))

## ReplicaSet

ReplicaSet ensures that a specified number of pod replicas are running at any given time.

- **spec** (ReplicaSetSpec)
  - **selector** (LabelSelector), required
    - >Selector is a label query over pods that should match the replica count.
  - **template** [PodTemplateSpec](#podtemplate)
  - **replicas** (int32)
    - >Replicas is the number of desired replicas. 
    - >This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. 

*Reference/Kubernetes API*

# Service Resources

<https://kubernetes.io/docs/reference/kubernetes-api/service-resources/>

## Service

Service is `a named abstraction of software service` (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.

- **spec** (ServiceSpec)
  - **ports** ([]ServicePort)
    - **ports.port** (int32), required
      - >The port that will be exposed by this service.
    - **ports.targetPort** (IntOrString)
      - >Number or name of the port to access on the pods targeted by the service.  
        Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.  
        ---
        >If this is a string, it will be looked up as a named port in the target Pod's container ports.  
        If this is not specified, the value of the 'port' field is used (an identity map).  
        This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field.
    - **ports.nodePort (int32)**
      - >The port on each node on which this service is exposed when type is NodePort or LoadBalancer.
    - **ports.name** (string)
  - **selector** (map[string]string)
    - Route service traffic to pods with label keys and values matching this selector.
  - **type** (string)
    - >type determines how the Service is exposed. Defaults to ClusterIP.
    - >"ExternalName" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services.

A middle line in front of an item start, marking it and with followers as an item of an array.
```yaml
- port: 80
  protocol: TCP
  targetPort: 8080
```

*Reference/Kubernetes API*

# Config and Storage Resources

## Volume

[link](https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/volume/)

Volume represents a named volume in a pod that may be accessed by any container in the pod.

# Authentication Resources 

## ServiceAccount

- **Example**  
  ```yaml
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    name: bookinfo-details
    labels:
      account: details
  ```
  
# Common Definitions

[doc](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/)


## LabelSelector

A label selector is a label query over a set of resources.  
The result of `matchLabels` and `matchExpressions` are <mark>ANDed</mark>.  
An empty label selector matches <u>all objects</u>.  
A null label selector matches <u>no objects</u>.

- [selector](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/label-selector/)
  - matchExpressions ([]LabelSelectorRequirement)
    - > `matchExpressions` is a list of label selector requirements. The requirements are ANDed.  
        *A label selector requirement is a selector that contains `values`, `a key`, and `an operator` that relates the key and values.*
    - matchExpressions.key (string), required
      - >key is the label key that the selector applies to.
    - matchExpressions.operator (string), required
      - >operator represents a key's relationship to a set of values.  
        Valid operators are <u>In, NotIn, Exists and DoesNotExist</u>.
    - matchExpressions.values ([]string)
      - >values is an array of string values.  
        If the operator is `In` or `NotIn`, the values array must be non-empty.  
        If the operator is `Exists` or `DoesNotExist`, the values array must be empty.  
        This array is replaced during a strategic merge patch.
  - matchLabels (map[string]string)
    - >`matchLabels` is a map of {key,value} pairs.  
      A single {key,value} in the matchLabels map is equivalent to an element of `matchExpressions`,  
      whose key field is "`key`", the operator is "`In`", and the values array contains only "`value`".  
      The requirements are ANDed.


## ObjectMeta

[ObjectMeta](https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/object-meta/#ObjectMeta) is metadata that <u>all persisted resources must have</u>, which includes all objects users must create.

- **name** (string)
  - >Name must be unique within a namespace.
  - >https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
- **generateName** (string)
  - >GenerateName is an optional prefix, used by the server, to generate a unique name 
  - >ONLY IF the <mark>Name</mark> field has not been provided.
  - >If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with <u>a unique suffix</u>. 
- **namespace** (string)
  - >Namespace defines the space within which each name must be unique.   
    An empty namespace is equivalent to the "default" namespace,
- **labels** (map[string]string)
  - >Map of string keys and values that can be used to organize and categorize (scope and select) objects. 


# -Networking Reference

# Virtual IPs and Service Proxies

<span style='font-size: 16px;font-weight: 500'>kube-proxy</span>  

Each instance of `kube-proxy` watches the Kubernetes control plane for the addition and removal of Service and EndpointSlice objects.  
 
For each Service, `kube-proxy` calls appropriate APIs (depending on the kube-proxy mode) to configure the node to capture traffic to the Service's clusterIP and port,  
and redirect that traffic to one of the Service's endpoints (usually a Pod, but possibly an arbitrary user-provided IP address).


*Virtual IP mechanism for Services, using iptables mode*  
![alt](https://kubernetes.io/images/docs/services-iptables-overview.svg)

iptables
- A mode where the kube-proxy configures packet forwarding rules using iptables.

ipvs
- a mode where the kube-proxy configures packet forwarding rules using ipvs.

nftables
- a mode where the kube-proxy configures packet forwarding rules using nftables.


There is only one mode available for kube-proxy on Windows:
- kernelspace
  - a mode where the kube-proxy configures packet forwarding rules in the Windows kernel

# E-Networking Reference

# -- Setup tools

# Kubeadm

# -- Command line tool (kubectl) 

[link](https://kubernetes.io/docs/reference/kubectl/)

# -------------------------------------------------

# Api references

[doc](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.29/#api-overview)

Kubernetes resources and "records of intent" are all stored as <ul>API objects</u>.