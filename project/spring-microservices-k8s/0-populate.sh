set -x

../set-env.sh

EM_IP="$(kubectl get svc employee -n employee -o jsonpath='{.spec.clusterIP}')"
EM_PORT="$(kubectl get svc employee -n employee -o jsonpath='{.spec.ports[0].port}')"

# add employee
curl -X POST $EM_IP:$EM_PORT/ -H "accept: */*" -H "Content-Type: application/json" -d "{ \"age\": 25, \"departmentId\": 1, \"id\": \"1\", \"name\": \"Smith\", \"organizationId\": 1, \"position\": \"engineer\"}"
curl -X POST $EM_IP:$EM_PORT/ -H "accept: */*" -H "Content-Type: application/json" -d "{ \"age\": 45, \"departmentId\": 1, \"id\": \"2\", \"name\": \"Johns\", \"organizationId\": 1, \"position\": \"manager\"}"

# get employee
curl $EM_IP:$EM_PORT/

# add department
DP_IP="$(kubectl get svc department -n department -o jsonpath='{.spec.clusterIP}')"
DP_PORT="$(kubectl get svc department -n department -o jsonpath='{.spec.ports[0].port}')"
curl -X POST $DP_IP:$DP_PORT -H "accept: */*" -H "Content-Type: application/json" -d "{ \"employees\": [ { \"age\": 25, \"id\": 1, \"name\": \"Smith\", \"position\": \"engineer\" }, { \"age\": 45, \"id\": 2, \"name\": \"Johns\", \"position\": \"manager\" } ], \"id\": \"1\", \"name\": \"RD Dept.\", \"organizationId\": 1}"        
curl -X POST $DP_IP:$DP_PORT -H "accept: */*" -H "Content-Type: application/json" -d "{ \"employees\": [ { \"age\": 45, \"id\": 2, \"name\": \"Johns\", \"position\": \"manager\" } ], \"id\": \"1\", \"name\": \"RD Dept.\", \"organizationId\": 1}"

# get department
curl $DP_IP:$DP_PORT/


# add organization
ORG_IP="$(kubectl get svc organization -n organization -o jsonpath='{.spec.clusterIP}')"
ORG_PORT="$(kubectl get svc organization -n organization -o jsonpath='{.spec.ports[0].port}')"

curl -X POST $ORG_IP:$ORG_PORT/ -H "accept: */*" -H "Content-Type: application/json" -d "{ \"address\": \"Main Street\", \"departments\": [ { \"employees\": [ { \"age\": 25, \"id\": 1, \"name\": \"Smith\", \"position\": \"engineer\" } ], \"id\": 1, \"name\": \"Smith\" } ], \"employees\": [ { \"age\": 25, \"id\": 1, \"name\": \"Smith\", \"position\": \"engineer\" } ], \"id\": \"1\", \"name\": \"MegaCorp\"}"

# get organization
curl $ORG_IP:$ORG_PORT/1/with-employees

# get via gatway:nodeport
#GATEWAY_NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services gateway -n $NAMESPACE_GATEWAY)
#http http://microservices-cluster.info:${GATEWAY_NODEPORT}/employee/

# via ingress
#http http://microservices-cluster.info/employee/
#APP_URL=http://localhost:8080/
#curl -X POST "$APP_URL" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"age\": 25, \"departmentId\": 1, \"id\": \"1\", \"name\": \"Smith\", \"organizationId\": 1, \"position\": \"engineer\"}"
#curl -X GET "$APP_URL" -H "accept: */*" -H "Content-Type: application/json"