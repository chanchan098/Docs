# spring boot with k8s

https://spring.academy/guides/kubernetes-app-enhancements-spring-k8s

## Remove unused images

https://blog.csdn.net/zhijiesmile/article/details/121655812

`crictl images|grep none|awk '{print $3}'|xargs crictl rmi`

## Versions mapping sb to sc

https://spring.io/projects/spring-cloud

## Memory reinforced at concepts 

### ConfigMap

### Secret

### Deployment 

### Pod template 

## Containerize apps

## Mine Combined kubernetes with spring

<span style='font-size: 16px;font-weight: 500'>see also</span>  

- [priv-and-pub-key-sign-in(win-to-win)](../../z-cmd/cmd-uses.md#priv-and-pub-key-sign-inwin-to-win)
- [automated build](./build-lab-12-sc-k8s.sh)


---

### Namespace

`kubectl create namespace lab-12-sc-k8s`

---

### Cluster role

```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: lab-12-sc-k8s-kubernetes-namespace-reader
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["configmaps", "pods", "services", "endpoints", "secrets"]
    verbs: ["get", "list", "watch"]
```

`kubectl apply -f ../k8s/clusterrole.yaml -n default`

`kubectl create serviceaccount api-service-account -n lab-12-sc-k8s`

`kubectl create clusterrolebinding service-pod-reader-lab-12-sc-k8s --clusterrole=lab-12-sc-k8s-kubernetes-namespace-reader --serviceaccount=lab-12-sc-k8s:api-service-account`

---

### Add to pod spec and deploy

see [deployment](./k8s/deployment.yaml)

---

### Add configmaps and restart

`kubectl apply -f ../k8s/application-local.yaml -n lab-12-sc-k8s`

`kubectl rollout restart deployment/lab-12-sc-k8s -n lab-12-sc-k8s`

## Use ConfigMap from k8s into application outside cluster

### Config kubernets client on application outside

see also [java-client](../../operation/0-k8s-tasks.md#java-client)

`spring-cloud-kubernetes` also uses this `java-client`

### Do steps up to [cluster-role](#cluster-role)

and `kubectl apply -f ../k8s/application-local.yaml -n lab-12-sc-k8s`

Create some resources. Let the application outside cluster be able to access its
