
## REFS

https://github.com/FRRouting/frr

https://docs.frrouting.org/en/latest/setup.html

https://metallb.io/configuration/#enabling-bfd-support-for-bgp-sessions

## Configuration(two nodes)

`/etc/frr/frr.conf`

In this mode, The node must be in the k8s cluster as work node or control panel AND be the frr router.

Notice that it has huge differences to `layer2` mode, `layer2` uses arp spoofing which doesn't need real machine with the specific address. In BGP of `frr` a computer as virtual router, so the address advertised to network must map to the real machine.

### Installation

https://deb.frrouting.org/

### Config

<span style='font-size: 16px;font-weight: 500'>242</span>  

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
log syslog informational
frr version 7.5
frr defaults traditional
hostname bgp-router
log syslog

router bgp 242
 bgp router-id 192.168.0.242

 neighbor 192.168.0.243 remote-as 243
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

---

<span style='font-size: 16px;font-weight: 500'>243</span>  

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
log syslog informational
frr version 7.5
frr defaults traditional
hostname bgp-router
log syslog

router bgp 243
 bgp router-id 192.168.0.243

 neighbor 192.168.0.242 remote-as 242
 neighbor 192.168.0.242 route-map RM-IN in
 neighbor 192.168.0.242 route-map RM-OUT out
 neighbor 192.168.0.242 passive
!
 address-family ipv4 unicast
   network 192.168.0.0/24
   neighbor 192.168.0.242 activate
 exit-address-family
```

</details>

---


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
    - 192.168.0.242/32
    - 192.168.0.243/32
  avoidBuggyIPs: true
```


## ERRORS

in machine 243 use this configuration

```
apiVersion: metallb.io/v1beta2
kind: BGPPeer
metadata:
  name: p242
  namespace: metallb-system
spec:
  myASN: 242
  peerASN: 243
  peerAddress: 192.168.0.243  
```

got


```javascript
{"caller":"native.go:101","error":"read OPEN from \"192.168.0.243:179\": EOF","level":"error","localASN":242,"msg":"failed to connect to peer","op":"connect","peer":"192.168.0.243:179","peerASN":243,"ts":"2024-07-31T08:10:45Z"}
{"caller":"native.go:101","error":"read OPEN from \"192.168.0.243:179\": EOF","level":"error","localASN":242,"msg":"failed to connect to peer","op":"connect","peer":"192.168.0.243:179","peerASN":243,"ts":"2024-07-31T08:12:45Z"}
```

https://metallb.io/configuration/#enabling-bfd-support-for-bgp-sessions
