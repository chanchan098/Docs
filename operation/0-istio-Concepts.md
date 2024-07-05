https://istio.io/latest/docs/concepts/

# Traffic Management

Istio’s traffic routing rules let you easily control the flow of traffic and API calls between services.

Istio’s traffic management model relies on the <u>Envoy proxies</u> that are deployed along with your services.  
All traffic that your mesh services send and receive (data plane traffic) is proxied through Envoy, making it easy to direct and control traffic around your mesh without making any changes to your services.

## Introducing Istio traffic management

In order to direct traffic within your mesh, Istio needs to know where all your endpoints are, and which services they belong to. 

To populate its own service registry, Istio connects to a service discovery system. 

# Virtual services


<span style='font-size: 16px;font-weight: 500'>What is it?</span>  

Virtual services, along with destination rules, are the key building blocks of Istio’s traffic routing functionality.  

A virtual service lets you configure how requests are routed to a service within an Istio service mesh,   building on the basic connectivity and discovery provided by Istio and your platform.

## Why use virtual services?



## Gateways

## Sidecars

By default, Istio configures every Envoy proxy to accept traffic on all the ports of its associated workload, and to reach every workload in the mesh when forwarding traffic. 

