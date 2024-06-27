kubectl create namespace department  
kubectl create namespace employee
kubectl create namespace gateway
kubectl create namespace organization
kubectl create namespace mongo


kubectl apply -f ../k8s/rbac-cluster-role.yaml -n default


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


$apf ../k8s/mongodb-deployment.yaml -n mongo
$apf ../k8s/mongodb-configmap.yaml -n mongo
$apf ../k8s/mongodb-secret.yaml -n mongo

$apf ../k8s/department-configmap.yaml -n department
$apf ../k8s/department-secret.yaml -n department
$apf ../k8s/department-deployment.yaml -n department


$apf ../k8s/gateway-configmap.yaml -n gateway
kubectl apply -f ../k8s/gateway-deployment.yaml -n gateway


$apf ../k8s/employee-configmap.yaml -n employee
$apf ../k8s/employee-secret.yaml -n employee
$apf ../k8s/employee-deployment.yaml -n employee


$apf ../k8s/organization-configmap.yaml -n organization
$apf ../k8s/organization-secret.yaml -n organization
$apf ../k8s/organization-deployment.yaml -n organization

kubectl apply -f ../k8s/ingress.yaml
