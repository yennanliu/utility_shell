# Step 1) install minikube
# https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fhomebrew

brew install minikube

minikube start --driver=docker

minikube drivers

minikube status

kubectl get nodes

# Step 2) install k8s
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
