
https://github.com/FRRouting/frr

## Configuration(two nodes)

In this mode, The node must be in the k8s cluster as work node or control panel AND be the frr router.

Notice that it has huge differences to `layer2` mode, `layer2` uses arp spoofing which doesn't need real machine with the specific address. In BGP of `frr` a computer as virtual router, so the address advertised to network must map to the real machine.

### Installation

https://deb.frrouting.org/

### Config


<span style='font-size: 16px;font-weight: 500'>241</span>  

<details>
<summary>config</summary>

```
# default to using syslog. /etc/rsyslog.d/45-frr.conf places the log in
# /var/log/frr/frr.log
#
# Note:
# FRR's configuration shell, vtysh, dynamically edits the live, in-memory
# configuration while FRR is running. When instructed, vtysh will persist the
# live configuration to this file, overwriting its contents. If you want to
# avoid this, you can edit this file manually before starting FRR, or instruct
# vtysh to write configuration to a different file.
#log syslog informational
log syslog informational
frr version 7.5
frr defaults traditional
hostname frr-router
log syslog

! Enable syslog logging for bgpd
logging syslog
  facility daemon
  ident bgpd
  level debugging


router bgp 64501
 bgp router-id 192.168.0.241
# neighbor 192.168.0.244 remote-as 64500
# neighbor 192.168.0.244 route-map RM-IN in
# neighbor 192.168.0.244 route-map RM-OUT out
# neighbor 192.168.0.244 passive


 neighbor 192.168.0.243 remote-as 64502
 neighbor 192.168.0.243 route-map RM-IN in
 neighbor 192.168.0.243 route-map RM-OUT out
 neighbor 192.168.0.243 passive
!
 address-family ipv4 unicast
   network 192.168.0.0/24
   neighbor 192.168.0.243 activate
 exit-address-family
```

</details>



<span style='font-size: 16px;font-weight: 500'>243</span>  

<details>
<summary>243</summary>

```
# default to using syslog. /etc/rsyslog.d/45-frr.conf places the log in
# /var/log/frr/frr.log
#
# Note:
# FRR's configuration shell, vtysh, dynamically edits the live, in-memory
# configuration while FRR is running. When instructed, vtysh will persist the
# live configuration to this file, overwriting its contents. If you want to
# avoid this, you can edit this file manually before starting FRR, or instruct
# vtysh to write configuration to a different file.
log syslog informational
frr version 7.5
frr defaults traditional
hostname frr-router
log syslog


router bgp 64502
 bgp router-id 192.168.0.243

 neighbor 192.168.0.241 remote-as 64501
 neighbor 192.168.0.241 route-map RM-IN in
 neighbor 192.168.0.241 route-map RM-OUT out
# neighbor 192.168.0.241 passive

# neighbor 192.168.0.244 remote-as 64500
# neighbor 192.168.0.244 route-map RM-IN in
# neighbor 192.168.0.244 route-map RM-OUT out
# neighbor 192.168.0.244 passive
!
 address-family ipv4 unicast
   network 192.168.0.0/24
   neighbor 192.168.0.241 activate
 exit-address-family
```

</details>



<span style='font-size: 16px;font-weight: 500'>k8s `bgppeer.yaml`</span>  

```
apiVersion: metallb.io/v1beta2
kind: BGPPeer
metadata:
  name: sample
  namespace: metallb-system
spec:
  myASN: 64502
  peerASN: 64501
  peerAddress: 192.168.0.241
```



<span style='font-size: 16px;font-weight: 500'>k8s `localips.yaml`</span>  

```
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: ippool-ns-service-alloc-sample
  namespace: metallb-system
spec:
  addresses:
    - 192.168.0.243/32
    - 192.168.0.247/32
    - 192.168.0.249/32
  avoidBuggyIPs: true
```
