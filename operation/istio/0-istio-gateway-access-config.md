## Modify manually

```shell
kubectl get svc istio-ingressgateway -n istio-system
NAME                   TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)   AGE
istio-ingressgateway   LoadBalancer   10.96.86.24   <pending>   15021:30696/TCP,80:30417/TCP,443:31480/TCP,31400:30629/TCP,15443:30304/TCP   4h45m
```

`kubectl get svc istio-ingressgateway -n istio-system -o yaml > istio-ingressgateway.yaml`

edit it
```yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    metallb.universe.tf/allow-shared-ip: "true"
  labels:
    app: istio-ingressgateway
    istio: ingressgateway
    release: istio
  name: istio-ingressgateway
  namespace: istio-system
spec:
  type: LoadBalancer
  selector:
    app: istio-ingressgateway
  ports:
  - port: 15021
    targetPort: 15021
    protocol: TCP
    name: status-port
  - port: 80
    targetPort: 80
    protocol: TCP
    name: http2
  - port: 443
    targetPort: 443
    protocol: TCP
    name: https
  - port: 31400
    targetPort: 31400
    protocol: TCP
    name: tcp
  - port: 15443
    targetPort: 15443
    protocol: TCP
    name: tls
  externalIPs:
  - 192.168.0.244  # Replace with your desired external IP

```

`kubectl apply -f istio-ingressgateway.yaml`

o-ingressgateway.yaml
root@user:/home/user/dr/k8s/istio-1.21.0# 

## Use nginx proxy 

nginx ingress

https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

## MetalLB

https://github.com/metallb/metallb