If you do not want to use a LoadBalancer service to expose your Istio Ingress Gateway, you can use a combination of NodePort services and external DNS to achieve this. Here’s how you can set it up:

Using NodePort and External DNS
Expose the Istio Ingress Gateway as a NodePort:

Change the istio-ingressgateway service type to NodePort.


`kubectl edit svc istio-ingressgateway -n istio-system`

Modify the type to NodePort:


```
spec:
  type: NodePort
```

Save and exit the editor. This will expose the service on a port on each node in your Kubernetes cluster. You can find the NodePort by running:


`kubectl get svc istio-ingressgateway -n istio-system`

Look for the NodePort value under the PORT(S) column, something like 80:32000/TCP.

Set Up External DNS to Point to Your Node IP:

Assuming your Kubernetes nodes have public IP addresses (or are reachable within your network), you need to set up DNS to point to the IP address of one or more of your nodes.

In your domain registrar’s DNS management console, create A records pointing to the IP addresses of your nodes. For example:

If your domain is mydomain.com and your nodes have IP addresses 192.168.1.10 and 192.168.1.11, create A records like:

```
mydomain.com A 192.168.1.10
mydomain.com A 192.168.1.11
```
Configure Gateway and VirtualService:

Create your Gateway and VirtualService as you would normally. Here is an example:

Gateway Resource:
```
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: my-gateway
  namespace: istio-system
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "mydomain.com"
```
VirtualService Resource:


```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: my-virtualservice
  namespace: default
spec:
  hosts:
  - "mydomain.com"
  gateways:
  - istio-system/my-gateway
  http:
  - match:
    - uri:
        prefix: /service1
    route:
    - destination:
        host: service1.default.svc.cluster.local
        port:
          number: 80
```

Apply these resources:

```
kubectl apply -f my-gateway.yaml
kubectl apply -f my-virtualservice.yaml
```
Access Your Services:

Now, when you access http://mydomain.com/service1, the DNS resolution will point to one of your node IPs, and the NodePort will route the traffic to the Istio Ingress Gateway, which will then forward it to the appropriate service within your cluster.

Summary
Using NodePort along with external DNS configuration allows you to expose your services without relying on a LoadBalancer. This method leverages the node's IP address and a stable port to provide access to your services. However, ensure your nodes are reachable and that the node IPs are correctly configured in your DNS records. If you are in a cloud environment or have a dynamic IP setup, you may need to update the DNS records if the node IPs change.