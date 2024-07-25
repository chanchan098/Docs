https://github.com/acassen/keepalived/tree/master/doc/samples

https://www.keepalived.org/doc/

https://www.keepalived.org/manpage.html



## Nginx HA sample, two nodes

### 0. installation

`apt-get install keepalived`

`apt-get install nginx`


### 1. config nginx

nginx `/etc/nginx/`

### 2. config keepalived


<span style='font-size: 16px;font-weight: 500'>master</span>  

```
vrrp_script check {
    script "/usr/local/bin/check_nginx.sh"
    interval 10
    weight 1
}

vrrp_instance VI_1 {
    state MASTER
    interface enp0s8  # Ensure this is the correct network interface
    virtual_router_id 51
    priority 101
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass my_secret  # Must match on both nodes
    }
    virtual_ipaddress {
        192.168.0.222
    }
    track_script {
        check
    }
}
```


<span style='font-size: 16px;font-weight: 500'>backup</span>  

```
vrrp_script check {
    script "/usr/local/bin/check_nginx.sh"
    interval 10
    weight 1
}

vrrp_instance VI_1 {
    state BACKUP
    interface enp0s8  # Ensure this is the correct network interface
    virtual_router_id 51
    priority 101
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass my_secret  # Must match on both nodes
    }
    virtual_ipaddress {
        192.168.0.222
    }
    track_script {
        check
    }
}
```

### 3. check script

```shell
#!/bin/bash
A=`ps -C nginx --no-header |wc -l`
if [ $A -eq 0 ];then

 systemctl start nginx  
 sleep 2
 if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then
 killall keepalived
 fi
fi
```



```shell
#!/bin/bash
A=`ps -C nginx --no-header |wc -l`
if [ $A -eq 0 ];then
# sleep 2
 systemctl start nginx  
 systemctl restart keepalived
 sleep 2
 if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then
 killall keepalived
 fi
fi
```