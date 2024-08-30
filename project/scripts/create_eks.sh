# Verify aws configuration
aws sts get-caller-identity

# Create an EKS
eksctl create cluster --name my-cluster --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2

# Update kubeconfig
aws eks --region us-east-1 update-kubeconfig --name my-cluster

# kubectl view config
kubectl config current-context
kubectl config view

# Apply PV, PVC, postgres-deployment yaml manifests
kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml

# Get pods on EKS
kubectl get pods

# Delete cluster
# eksctl delete cluster --name my-cluster --region us-east-1
