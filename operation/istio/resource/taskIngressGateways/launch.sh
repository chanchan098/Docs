istioctl install --set profile=demo -y

kubectl label namespace default istio-injection=enabled

kubectl apply -f samples/httpbin/httpbin.yaml

kubectl apply -f ./taskIngressGateways/istio-gateway.yaml

kubectl apply -f ./taskIngressGateways/istio-gateway-vservice.yaml

$allpods
$allsvcs