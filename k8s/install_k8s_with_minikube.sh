# https://kubernetes.io/docs/setup/learning-environment/minikube/

# for Mac OSX

# Step 1) Start Minikube and create a cluster
minikube start

# Step 2) Create a Kubernetes Deployment using an existing image named echoserver, which is a simple HTTP server and expose it on port 8080 using --port.
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10

# Step 3) Expose it as a Service for accessing the hello-minikube Deployment
kubectl expose deployment hello-minikube --type=NodePort --port=8080

# Step 4) Check if the Pod is up and running
kubectl get pod

# Step 5) Get the URL of the exposed Service to view the Service details
minikube service hello-minikube --url

# Step 6) Delete the hello-minikube Service
kubectl delete services hello-minikube

# Step 7) Delete the hello-minikube Deployment
kubectl delete deployment hello-minikube

# Step 8) Stop the local Minikube cluster
minikube stop

# Step 9) Delete the local Minikube cluster
minikube delete

