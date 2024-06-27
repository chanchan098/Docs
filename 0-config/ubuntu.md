## ubuntu server static ip

<https://ubuntu.com/server/docs/network-configuration>

## IO Redirection

https://linuxhandbook.com/redirection-linux/

https://www.cnblogs.com/gao0722/p/15026546.html

* redirect input and output
    * 0(stdin),1(stdout),2(stderr),3+(file descriptor)
    * \>(redirecting stdout and overwrited), >>(redirecting stdout and appended)
    * &>(redirecting stdout, stderr and ... ), &>>
    * < ,stdin
* pipeline
    * cat file | grep str
* awk
    *  ip addr | grep 'inet ' | tee ip
    *  awk -F"/" '{system("echo " $1)}' ip    



## Process substitution

https://linuxhandbook.com/bash-process-substitution/


## Environment configs

`vim /etc/profile`

```shell
. /home/user/dr/k8s/cmds

export hp="export http_proxy=http://192.168.0.116:10809;export https_proxy=http://192.168.0.116:10809"
export KUBECONFIG=/etc/kubernetes/admin.conf
export resp=http://192.168.0.116:8089/resource
export ISTIO_B=/home/user/dr/k8s/istio-1.21.0/bin

export PATH=$PATH:$KUBECONFIG:$ISTIO_B
```

- execute string as cmd
  - `eval $hp`