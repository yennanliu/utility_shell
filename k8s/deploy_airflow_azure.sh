# https://medium.com/@chen_13104/airflow-on-azure-kubernetes-part-1-6ded98d6b8d6

# delete last namespace
kubectl delete namespace airflow3

# create a new namespace
kubectl create namespace airflow4

# create password for postgres, redis
kubectl create secret generic airflow-postgres -n airflow4 --from-literal=postgres-password=$(openssl rand -base64 13)

kubectl create secret generic airflow-redis -n airflow4 --from-literal=redis-password=$(openssl rand -base64 13)

# deploy to azure
helm install  --namespace airflow4  --generate-name --debug .

# watch
kubectl get pods -n airflow4 --watch
