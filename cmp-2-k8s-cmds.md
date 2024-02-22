# cmp-2-k8s-cmds.md



kubeadm init \
--image-repository registry.aliyuncs.com/google_containers \
--v=5 

kubectl get pods --all-namespaces

kubectl describe pod {pod} -n [namespace]


