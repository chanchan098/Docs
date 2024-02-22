

windows
set STORAGE_TYPE=elasticsearch

STORAGE_TYPE=elasticsearch ES_HOSTS=127.0.0.1:9200 java -jar /zipkin-dependencies.jar


java -jar zipkin-dependencies.jar --STORAGE_TYPE=elasticsearch ES_HOSTS=127.0.0.1:9200 
java -jar zipkin-dependencies.jar STORAGE_TYPE=elasticsearch ES_HOSTS=127.0.0.1:9200 
tail -f ~/logs/rocketmqlogs/namesrv.log


./bin/kafka-server-stop.sh; nohup ./bin/kafka-server-start.sh config/server.properties &

./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic TestTopic

./bin/kafka-topics.sh --zookeeper 192.168.0.228:2181,192.168.0.215:2182,192.168.0.216:2183 --delete --topic TestTopic
./bin/kafka-topics.sh --create --zookeeper 192.168.0.228:2181,192.168.0.215:2182,192.168.0.216:2183 --replication-factor 1 --partitions 3 --topic TestTopic

./bin/kafka-console-producer.sh --broker-list 192.168.0.228:9092,192.168.0.215:9092,192.168.0.216:9092 --topic TestTopic

./bin/kafka-console-consumer.sh --bootstrap-server 192.168.0.228:9092,192.168.0.215:9092,192.168.0.216:9092 --topic TestTopic
kubectl port-forward --address 0.0.0.0 -n dev service/hello-minikube1 8080:80

192.168.0.228:9092,192.168.0.215:9092,192.168.0.216:9092

# ssh

```
123456

ssh -t root@192.168.0.243 "cd  /home/user/ ; bash --login"

ssh root@192.168.0.242 # 123456
ssh -t root@192.168.0.242 "cd  /home/x/ ; bash --login"

ssh root@192.168.0.241 # 123456
ssh -t root@192.168.0.241 "cd  /home/x/ ; bash --login"

# data & mgm node 
ssh root@192.168.0.240 
ssh -t root@192.168.0.240 "cd  /home/x/ ; bash --login"

ssh user@192.168.0.117 # 123456

ssh user@192.168.0.117 
G:&&cd G:\liaoyj\Tools\vmbox
VBoxManage startvm "ubuntu-server" --type headless
VBoxManage startvm "ubuntu-server22.04-2" --type headless
VBoxManage startvm "ubuntu-server22.04-3" --type headless
VBoxManage startvm "ubuntu-server" --type headless && VBoxManage startvm "ubuntu-server22.04-2" --type headless && VBoxManage startvm "ubuntu-server22.04-3" --type headless
VBoxManage.exe list vms
VBoxManage list runningvms
VBoxManage controlvm <uuid | vmname> acpipowerbutton

G: && cd G:\liaoyj\Tools\vmbox && start VirtualBox.exe

```


# java
D:\liaoyj\DevelopmentResources\jdk-11.0.18\bin\java.exe

# jenkins
debb2fdc0cdb4dd1933d9b5c0101f541

C:\Users\Administrator\.jenkins\secrets\initialAdminPassword



# kubernetes

## Turn off swap
swapoff -a

 sudo vim /etc/fstab

 `#/host/ubuntu/disks/swap.disk none            swap    loop,sw         0       0`


minikube start --vm-driver=hyperv --force

minikube start --nodes 2 -p multinode-demo --vm-driver=hyperv --force

crictl pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.3

https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
ctr -n k8s.io image tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.6 registry.k8s.io/pause:3.6
--apiserver-advertise-address=10.0.2.15




kubeadm config images list
crictl images

docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.6 

## images

registry.cn-hangzhou.aliyuncs.com/google_containers/pause

kubeadm config images pull --image-repository registry.aliyuncs.com/google_containers

--image-repository https://docker.mirrors.ustc.edu.cn

ctr -n k8s.io i tag harbocto.boe.com.cn/public/rancher-agent:v2.6.9 rancher/rancher-agent:v2.6.9
rancher/rancher-agent:v2.6.9


## init 
kubeadm config images list
 docker pull registry.aliyuncs.com/google_containers/coredns:1.8.0

setenforce 0


kubeadm init  --v=5
kubeadm init   --image-repository registry.aliyuncs.com/google_containers   --v=5 

kubeadm init   --image-repository registry.aliyuncs.com/google_containers  --v=5 

kubectl apply -f http://192.168.0.116:8089/resource/weave-daemonset-k8s.yaml
kubectl apply -f http://192.168.0.116:8089/resource/kube-flannel.yml
kubectl apply -f http://192.168.0.116:8089/resource/calico.yaml


rm -rf $HOME/.kube \
; mkdir -p $HOME/.kube \
; sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config \
; sudo chown $(id -u):$(id -g) $HOME/.kube/config \
; export KUBECONFIG=/etc/kubernetes/admin.conf

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join your ip:6443 --token your token --discovery-token-ca-cert-hash sha256:your hash

## status
kubectl get pods -n kube-system
kubectl get pod --all-namespaces
kubectl get nodes
kubectl cluster-info

docker info | grep Cgroup
cat /var/lib/kubelet/config.yaml | grep cgroup


## log
cat /var/log/syslog | tail -20

kubectl logs etcd-x-virtualbox -n kube-system
journalctl -xeu kubelet
docker tag coredns/coredns:1.10.1 registry.k8s.io/coredns/coredns:v1.10.1

crictl tag registry.aliyuncs.com/google_containers/coredns:v1.10.1 registry.k8s.io/coredns/coredns:v1.10.1

## reset
/etc/kubernetes/manifests/etcd.yaml
kubeadm reset;
rm -rf $HOME/.kube/;ipvsadm --clear

rm -rf /etc/kubernetes;rm -rf /var/lib/kubelet;rm -rf /var/lib/etcd;rm -rf /var/lib/cni;rm -rf /var/run/calico;rm -rf /var/run/flannel;rm -rf /usr/local/bin/kubectl;rm -rf /usr/local/bin/kubeadm;rm -rf /usr/local/bin/kubelet;

sudo apt-get install -y apt-transport-https ca-certificates curl gpg;curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg;echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get install -y kubelet kubeadm kubectl;sudo apt-mark hold kubelet kubeadm kubectl

# proxy
vim /etc/systemd/system/docker.service.d/http-proxy.conf 

export http_proxy= ;export https_proxy=

export http_proxy=http://192.168.0.116:10809;export https_proxy=http://192.168.0.116:10809

export http_proxy=http://192.168.0.117:10809;export https_proxy=http://192.168.0.117:10809

set http_proxy=http://192.168.0.117:10809 && set https_proxy=http://192.168.0.117:10809

set http_proxy=http://192.168.0.117:10809 ; set https_proxy=http://192.168.0.117:10809
git clone https://github.com/docker/getting-started-app.git

# zookeeper

./bin/zkServer.sh start conf/zx.cfg
./bin/zkServer.sh start conf/zoo.cfg
./bin/zkServer.sh status

./bin/zkCli.sh -server 192.168.0.228:2181,192.168.0.215:2182,192.168.0.216:2183



# rocketmq
cd /home/x/dr/rk
nohup sh bin/mqnamesrv &
tail -f ~/logs/rocketmqlogs/namesrv.log


nohup sh bin/mqbroker -c conf/broker.conf  -n 192.168.0.228:9876 &
tail -f ~/logs/rocketmqlogs/broker.log

# nginx
configuraion path: /etc/nginx

```
server {
        listen       7999;
        server_name  resource;
        location /resource {
            # On windows is root, here is alias.
            alias /home/x/resource;
            sendfile on;
            autoindex on;
            autoindex_exact_size on;
            autoindex_localtime on;
            charset gbk;
    }
}
```



# redis-cluster

D: & cd D:\liaoyj\DevelopmentResources\Redis-x64-5.0.14.1-7000 & redis-cli.exe --cluster create 192.168.0.116:7000 192.168.0.116:7002 192.168.0.116:7004 192.168.0.116:7001 192.168.0.116:7003 192.168.0.116:7005 --cluster-replicas 1

D: & cd D:\liaoyj\DevelopmentResources\Redis-x64-5.0.14.1-7000 & boot-redis.bat

redis-cli.exe -p 7000 -c

# kafka

nohup bin/kafka-server-start.sh config/server.properties &
tail -f logs/server.log

bin/kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic TestTopic
bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic TestTopic --from-beginning

bin/kafka-topics.sh --list --zookeeper 127.0.0.1:2181

# zookeeper
bin/zkServer.sh start # defaut to zoo.cfg 

# mysql
 dba.checkInstanceConfiguration('rpl_user@192.168.0.116:3308')
 dba.checkInstanceConfiguration('rpl_user@127.0.0.1:3308')
dba.configureInstance('rpl_user@127.0.0.1:3308')
 dba.configureLocalInstance('rpl_user@127.0.0.1:3308')

./mysqlsh.exe --uri rpl_user@127.0.0.1:3308

var cluster = dba.createCluster('testCluster')
cluster.addInstance('icadmin@127.0.0.1:3309')
cluster.status()

 ./mysqlrouter.exe --bootstrap root@localhost:3308 

./mysqlrouter.exe --bootstrap localhost:3308