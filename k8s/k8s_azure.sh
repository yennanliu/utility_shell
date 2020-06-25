### part 1 deploy service to k8s via CLI (az)###
# https://docs.microsoft.com/zh-tw/azure/aks/kubernetes-walkthrough

# step 1) create resource group
az group create --name <your_resource_group> --location eastus

# step 2) create AKS (Azure k8s) cluster 
az aks create --resource-group <your_resource_group> --name <k8s_cluster_namer> --node-count 1 --enable-addons monitoring --generate-ssh-keys

# step3) connect to cluster
az aks get-credentials --resource-group <your_resource_group> --name <k8s_cluster_namer>
kubectl get nodes

# step 4) run the app
# save/get the azure-vote.yaml first
kubectl apply -f azure-vote.yaml

# step 5) test the app
kubectl get service azure-vote-front --watch

# step 6) delete the cluster 
az group delete --name <your_resource_group> --yes --no-wait


### part 2 : k8s dashboard ###  
# https://docs.microsoft.com/zh-tw/azure/aks/kubernetes-dashboard

# launch k8s dashboard
#az aks browse --resource-group aks --name airflow-k8s
az aks browse --resource-group <your_resource_group> --name <k8s_cluster_namer>
