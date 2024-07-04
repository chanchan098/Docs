kubectl delete -f mysql-deployment.yaml

kubectl delete -f mysql-secret.yaml

kubectl delete -f mysql-storage.yaml


sleep 5

kubectl apply -f mysql-secret.yaml

kubectl apply -f mysql-storage.yaml

kubectl apply -f mysql-deployment.yaml

kubectl get pod
