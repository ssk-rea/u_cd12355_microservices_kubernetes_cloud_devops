# Get the pod that is running the postgres
kubectl get pods

# Run interactive shell on the pod
kubectl exec -it postgresql-6889d46b98-bd84h -- bash

# inside the pod run:
# psql -U myuser -d mydatabase

# List tables
# /l

kubectl apply -f postgresql-service.yaml

# List the services
kubectl get svc

# Set up port-forwarding to `postgresql-service`
kubectl port-forward service/postgresql-service 5433:5432 &

# Install required libraries
apt update
apt install postgresql postgresql-contrib

# Run the SQL queries on the DB
export DB_PASSWORD=mypassword
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/1_create_tables.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/2_seed_users.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < starter/db/3_seed_tokens.sql

# Verify the entries in the tables
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 "select *from users;"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 "select *from tokens;"

# Closer port forwarding
# ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill

