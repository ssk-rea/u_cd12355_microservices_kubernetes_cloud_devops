# Get the pod that is running the postgres
kubectl get pods

# Run interactive shell on the pod
# kubectl exec -it postgresql-688c5c767c-7hcg8 -- bash

# inside the pod run:
# psql -U myuser -d mydatabase

# List tables
# /l

echo "Creating postgresql DB service"
kubectl apply -f postgresql-deployment.yaml
kubectl apply -f postgresql-service.yaml

# List the services
echo "Show K8s services"
kubectl get svc

# Set up port-forwarding to `postgresql-service`
echo "forwarding port for DB service"
kubectl port-forward service/postgresql-service 5433:5432 &

# Install required libraries
echo "installing libraries"
apt update
apt install -y postgresql postgresql-contrib

# Run the SQL queries on the DB
export DB_PASSWORD=mypassword
echo "inserting 1_create_tables"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/1_create_tables.sql

echo "inserting 2_seed_users"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/2_seed_users.sql

echo "inserting 3_seed_tokens"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/3_seed_tokens.sql

# Verify the entries in the tables
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 "select * from users;"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 "select * from tokens;"

# Closer port forwarding
# ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill

