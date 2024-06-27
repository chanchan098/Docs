kubectl create namespace department  
kubectl create namespace employee  
kubectl create namespace gateway  
kubectl create namespace organization  
kubectl create namespace mongo  


kubectl apply -f rbac-cluster-role.yaml -n default  


kubectl create serviceaccount api-service-account -n department  
kubectl create serviceaccount api-service-account -n employee  
kubectl create serviceaccount api-service-account -n gateway 
kubectl create serviceaccount api-service-account -n organization  
kubectl create serviceaccount api-service-account -n mongo  


kubectl create clusterrolebinding service-pod-reader-department --clusterrole=microservices-kubernetes-namespace-reader --serviceaccount=department:api-service-account 
kubectl create clusterrolebinding service-pod-reader-employee --clusterrole=microservices-kubernetes-namespace-reader --serviceaccount=employee:api-service-account 
kubectl create clusterrolebinding service-pod-reader-gateway --clusterrole=microservices-kubernetes-namespace-reader --serviceaccount=gateway:api-service-account 
kubectl create clusterrolebinding service-pod-reader-organization --clusterrole=microservices-kubernetes-namespace-reader --serviceaccount=organization:api-service-account 
kubectl create clusterrolebinding service-pod-reader-mongo --clusterrole=microservices-kubernetes-namespace-reader --serviceaccount=mongo:api-service-account 


$apf mongodb-deployment.yaml -n mongo 
$apf mongodb-configmap.yaml -n mongo 
$apf mongodb-secret.yaml -n mongo 

$apf department-configmap.yaml -n department 
$apf department-secret.yaml -n department  
$apf department-deployment.yaml -n department 


$apf gateway-configmap.yaml -n gateway 
kubectl apply -f gateway-deployment.yaml -n gateway 


$apf employee-configmap.yaml -n employee 
$apf employee-secret.yaml -n employee 
$apf employee-deployment.yaml -n employee 


$apf organization-configmap.yaml -n organization 
$apf organization-secret.yaml -n organization 
$apf organization-deployment.yaml -n organization 



kubectl apply -f ingress.yaml 
