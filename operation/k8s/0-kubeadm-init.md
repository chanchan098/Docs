# ops-2.1-kubeadm-init.md
- [ops-2.1-kubeadm-init.md](#ops-21-kubeadm-initmd)
- [The versions and network are a snake hole!!!](#the-versions-and-network-are-a-snake-hole)
- [Crictl(containerd) proxy](#crictlcontainerd-proxy)
- [Kubeadm reset](#kubeadm-reset)
  - [after deletion to `/etc/cni/net.d`:](#after-deletion-to-etccninetd)
  - [Disk operation (VM)](#disk-operation-vm)
    - [Adds new partitions](#adds-new-partitions)
    - [Merges or removes spaces to partitions](#merges-or-removes-spaces-to-partitions)
    - [Extends logic volume](#extends-logic-volume)
  - [doc](#doc)
  - [Trun off swp: `swapoff -a` or `vim /etc/fstab`](#trun-off-swp-swapoff--a-or-vim-etcfstab)
  - [Sets timezone](#sets-timezone)
  - [~~Container runtime~~](#container-runtime)
    - [configure containerd](#configure-containerd)
  - [~~Download and retag images~~](#download-and-retag-images)
    - [~~Download and retag~~](#download-and-retag)
    - [Cn proxy](#cn-proxy)
    - [Query images](#query-images)
  - [Init shell](#init-shell)
    - [Network plugin](#network-plugin)
    - [References](#references)
  - [Start using cluster](#start-using-cluster)
  - [Launching a service](#launching-a-service)
    - [Create a pod](#create-a-pod)
    - [Create a service](#create-a-service)
    - [Clean](#clean)
  - [Command line references](#command-line-references)
    - [Query and download images](#query-and-download-images)
    - [Query status](#query-status)
    - [Log](#log)
- [Errors](#errors)
  - [Node is `not ready` after `kubeadm reset` when booted again](#node-is-not-ready-after-kubeadm-reset-when-booted-again)
  - [core-dns is `pending` after deleted `/etc/cni/net.d` when restart](#core-dns-is-pending-after-deleted-etccninetd-when-restart)
    - [container errors](#container-errors)
  - [after `kubeadm init`, run `systemctl status kubelet`](#after-kubeadm-init-run-systemctl-status-kubelet)
  - [`kubeadm init`](#kubeadm-init)
  - [`crictl images` CRI v1](#crictl-images-cri-v1)
    
# The versions and network are a snake hole!!!

# Crictl(containerd) proxy

[containerd](../0-image-proxy.md#containerd)

# Kubeadm reset

https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-reset/

do not delete `/etc/cni/net.d`, if it doesn't to be replaced to another network plugin.  
`rm -rf /etc/cni/net.d`

---

## after deletion to `/etc/cni/net.d`:

check out [container errors](#container-errors)

```
bash <<'EOF'
...
EOF
```

```
bash <<'EOF'

sudo systemctl stop kubelet

echo y|kubeadm reset --cleanup-tmp-dir
rm -rf /etc/cni/net.d
sudo rm -rf /var/lib/kubelet/*

sudo systemctl start kubelet

reboot

EOF
```

## Disk operation (VM)

### Adds new partitions

`fdisk`

```
fdisk
n
p
...
```


### Merges or removes spaces to partitions

`parted`

- [parted](https://www.cnblogs.com/ellisonzhang/p/13139159.html)

### Extends logic volume

- [Tutorial: Extends Free PE](https://www.linuxtechi.com/extend-volume-group-size/)
- [Tutorial: Extends Free PE2](https://blog.csdn.net/qq_40137850/article/details/110630758)


0. Creates a partition to use by `fdisk`.
1. Adds the partition to *Free PE*
2. Extends logic volume.




## [doc](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)

## Trun off swp: `swapoff -a` or `vim /etc/fstab`

## Sets timezone

`timedatectl set-timezone Asia/Shanghai`

## ~~Container runtime~~

* Container runtime, here is containerd.
  * Notice that this docker engine use differs to ordinary docker, it has an interface layer 
    called cri-dockerd which communicates to docker, pls check out official doc.
    * [cri-dockerd](https://kubernetes.io/zh-cn/docs/setup/production-environment/container-runtimes/#docker)
* [Cgroup details](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubeadm/configure-cgroup-driver/)

### configure containerd

```shell
containerd config default >/etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
systemctl restart containerd
systemctl enable containerd >/dev/null 2>&1
```



## ~~Download and retag images~~

see also [image-proxy](./0-image-proxy.md)

### ~~Download and retag~~

<details>
<summary>pullAndRetag.sh</summary>

```
prefix="registry.cn-hangzhou.aliyuncs.com/google_containers"

if [ -n "$1" ]; then
    prefix="$1"
else
    prefix="registry.cn-hangzhou.aliyuncs.com/google_containers"
fi

stringExtracting(){

    rm -f k8s__images_res.sh

    mapfile -t pending < <(kubeadm config images list)
    echo "imgs prefix used: $prefix"

    for p in ${pending[@]}
    do
        # echo "crictl pull $p"

        res=$(echo "$p" | sed "s|registry.k8s.io|$prefix|")

        pull=$(echo "crictl pull $res")

        tag=$(echo "ctr -n k8s.io i tag $res $p")

        echo "$pull" >> k8s__images_res.sh
        echo "$tag" >> k8s__temp_res.txt
    done
    cat k8s__temp_res.txt >> k8s__images_res.sh
    rm -f k8s__temp_res.txt
    echo "output: k8s__images_res.sh"
}

stringExtracting
```
</details>

### Cn proxy

```shell
sudo kubeadm config images pull --image-repository=registry.aliyuncs.com/google_containers

sudo kubeadm init --image-repository registry.aliyuncs.com/google_containers --apiserver-advertise-address=192.168.56.10  --pod-network-cidr=10.244.0.0/16
```

### Query images

* getting images to use: `kubeadm config images list`

## Init shell

`init-with-proxy.sh`
```shell
wget -nc https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml -O calico-master.yaml

wget -nc https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml -O metallb-native-v0.14.5.yaml

echo y | kubeadm reset

kubeadm init \
--kubernetes-version=v1.29.1 \
--image-repository registry.aliyuncs.com/google_containers \
--v=5

kubectl apply -f calico-master.yaml
kubectl apply -f metallb-native-0.14.5.yaml

sleep 5

kubectl apply -f ./metalb/sample2.yaml
```

### Network plugin

https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml

https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml


### References

- [install calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico)
- [install metallb](https://metallb.io/installation/)

## Start using cluster

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

export KUBECONFIG=/etc/kubernetes/admin.conf
```


## Launching a service

[example](https://learn-k8s-from-scratch.readthedocs.io/en/latest/k8s-install/verify.html#)

### Create a pod

`kubectl run web --image nginx`

### Create a service

`kubectl expose pod web  --port=80 --name=web-service --type=LoadBalancer`

### Clean

`kubectl delete service web-service ; kubectl delete pod web`


## Command line references

### Query and download images

```
#To query images
kubeadm config images list

# Pull an image with cn proxy 
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.6

# crictl usages
almost to docker

```

### Query status
```
kubectl get pods -n kube-system

kubectl get pod --all-namespaces

kubectl get nodes

kubectl cluster-info

docker info | grep Cgroup

cat /var/lib/kubelet/config.yaml | grep cgroup

```



### Log
```
cat /var/log/syslog | tail -20

kubectl logs etcd-x-virtualbox -n kube-system

journalctl -xeu kubelet

systemctl status kubelet

docker tag coredns/coredns:1.10.1 registry.k8s.io/coredns/coredns:v1.10.1

crictl tag registry.aliyuncs.com/google_containers/coredns:v1.10.1 registry.k8s.io/coredns/coredns:v1.10.1
```

```txt

# docker proxy

vim /etc/systemd/system/docker.service.d/http-proxy.conf 

```

# Errors

## Node is `not ready` after `kubeadm reset` when booted again

## core-dns is `pending` after deleted `/etc/cni/net.d` when restart

trying to delete pods related and launch again.

### container errors

`crictl ps -a | grep flannel | awk '{print $1}'`

## after `kubeadm init`, run `systemctl status kubelet`

said: `failed to pull image \"registry.k8s.io/pause:3.6\"`

download and retag it.

## `kubeadm init`

[ERROR CRI]: container runtime is not running: output: E0812


```
[root@master1 ~]# rm -rf /etc/containerd/config.toml
[root@master1 ~]# systemctl restart containerd
```

## `crictl images` CRI v1 


 validate service connection: validate CRI v1 image API for endpoint "unix:///var/run/dockershim.sock": rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing: dial unix /var/run/dockershim.sock: connect: no such file or directory"


you can set the values in /etc/crictl.yaml, like:
```
runtime-endpoint: "unix:///run/containerd/containerd.sock"
timeout: 0
debug: false
```

