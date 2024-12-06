# Image proxy

## Containerd

<https://stackoverflow.com/questions/77318225/how-to-configure-proxy-in-kubernetes-to-pull-images>

`/etc/systemd/system/containerd.service.d/http-proxy.conf`

```conf
[Service]
Environment="HTTP_PROXY=http://192.168.0.116:10809"
Environment="HTTPS_PROXY=http://192.168.0.116:10809"
Environment="NO_PROXY=127.0.0.1,10.96.0.0/12"
```

`Environment="NO_PROXY=127.0.0.1,10.96.0.0/12"` for filtering cluster network.



```shell
sudo systemctl daemon-reload; systemctl restart containerd; systemctl show --property=Environment containerd
```


coherent in `/etc/systemd/system/containerd.service.d/reload.sh`


### Local http

https://blog.csdn.net/justlpf/article/details/132224499

https://stackoverflow.com/questions/65724285/kubernetes-with-containerd-http-server-gave-http-response-to-https-client


## Docker

### Local proxy

[tutorial](https://blog.csdn.net/MacwinWin/article/details/131354874)

0. `mkdir /etc/systemd/system/docker.service.d`
1. `vim /etc/systemd/system/docker.service.d/http-proxy.conf`
2. 
    ```
    [Service]
    Environment="HTTP_PROXY=http://192.168.0.117:10809"
    Environment="HTTPS_PROXY=http://192.168.0.117:10809"
    Environment="NO_PROXY=NO_PROXY=127.0.0.1,10.96.0.0/12,192.168.0.0/12"
    ```
3. `sudo systemctl daemon-reload ; sudo systemctl restart docker`
4. `docker info |grep Proxy`

### [Remote proxy](https://blog.csdn.net/u012206617/article/details/109744243)
