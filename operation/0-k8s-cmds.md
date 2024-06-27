# ops-2-k8s-cmds.md



kubeadm init \
--image-repository registry.aliyuncs.com/google_containers \
--v=5 

kubectl get pods --all-namespaces

kubectl describe pod {pod} -n [namespace]


## crictl

https://github.com/containerd/containerd/blob/main/docs/getting-started.md#interacting-with-containerd-via-cli

default namespace `k8s.io`

## ctr

`ctr -n=k8s.io image pull ...`


## go into inside 

kubectl exec -it my-pod-name -- powershell
