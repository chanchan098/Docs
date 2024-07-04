kubectl delete -k ./res

sleep 5

kubectl apply -k ./res

kubectl get pod | grep mysql
kubectl get svc | grep mysql
