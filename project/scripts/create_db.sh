# Get the pod that is running the postgres
kubectl get pods

# Run interactive shell on the pod
kubectl exec -it postgresql-6889d46b98-bd84h -- bash

# inside the pod run:
psql -U myuser -d mydatabase

# List tables
/l


