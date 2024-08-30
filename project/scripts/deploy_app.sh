
echo "Creating postgresql DB configmap"
kubectl apply -f db_configmap.yaml

echo "Verify configmap"
kubectl describe configmap coworking-postgresql

# echo "mypassword" | base64
echo "Creating postgresql DB secrets"
kubectl apply -f db_secret.yaml

echo "Verify DB password"
kubectl get secret coworking-psql-pwd -o jsonpath="{.data.DB_PASSWORD}" | base64 -d

echo "Deploying application"
kubectl apply -f coworking-deployment.yaml