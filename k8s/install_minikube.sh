# https://kubernetes.io/docs/tasks/tools/install-minikube/

# for mac OSX

# Step 1) validate if VMX exists
sysctl -a | grep -E --color 'machdep.cpu.features|VMX'

# Step 2) Installing minikube
# install kubectl 
# install a Hypervisor : VirtualBox
# install minikube 
brew install minikube

# Step 3) Confirm Installation 
minikube start --driver=minikube_driver

# Step 4) Check status 
minikube status

# Step 5) Stop & (delete) minikube
minikube stop
minikube delete