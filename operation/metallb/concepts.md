

## METALLB IN LAYER 2 MODE

https://metallb.universe.tf/concepts/layer2/

In layer 2 mode, one node assumes the responsibility of advertising a service to the local network.  
From the network’s perspective, it simply looks like that machine has multiple IP addresses assigned to its network interface.

Under the hood, MetalLB responds to ARP requests for IPv4 services, and NDP requests for IPv6.

The major advantage of the layer 2 mode is its universality:  
it will work on any Ethernet network, with no special hardware required, not even fancy routers.

### Load-balancing behavior

In layer 2 mode, all traffic for a service IP goes to one node. From there, kube-proxy spreads the traffic to all the service’s pods.

In that sense, layer 2 does not implement a load balancer.  
Rather, it implements a failover mechanism so that a different node can take over should the current leader node fail for some reason.

If the leader node fails for some reason, failover is automatic:  
the failed node is detected using `memberlist`, at which point new nodes take over ownership of the IP addresses from the failed node.

### Limitations

Two main limitations: single-node bottlenecking, and potentially slow failover.

### Comparison to Keepalived

## METALLB IN BGP MODE

https://metallb.universe.tf/concepts/bgp/

In BGP mode, each node in your cluster establishes a BGP peering session with your network routers, and uses that peering session to advertise the IPs of external cluster services.

After the packets arrive at the node, `kube-proxy` is responsible for the final hop of traffic routing, to get the packets to one specific pod in the service.

### Load-balancing behavior

### Limitations

The biggest downside is that BGP-based load balancing does not react gracefully to changes in the backend set for an address.  
What this means is that when a cluster node goes down, you should expect all active connections to your service to be broken (users will see “Connection reset by peer”).

BGP-based routers implement stateless load balancing.  
They assign a given packet to a specific next hop by hashing some fields in the packet header, and using that hash as an index into the array of available backends.

**To get a new address**  
The problem is that the hashes used in routers are usually not stable,  
so whenever the size of the backend set changes (for example when a node’s BGP session goes down),  
existing connections will be rehashed effectively randomly,  
which means that the majority of existing connections will end up suddenly being forwarded to a different backend, one that has no knowledge of the connection in question.

**Connection forwarded and broken**  
The consequence of this is that any time the IP→Node mapping changes for your service,  
you should expect to see a one-time hit where most active connections to the service break. There’s no ongoing packet loss or blackholing, just a one-time clean break.

### What's BGP

see also [BGP](../../network/protocol/BGP.md)



## FRR-K8s Mode

https://www.redhat.com/en/blog/frr-k8s-bgp-backend-metallb

