# Run the SQL queries on the DB
export DB_PASSWORD=mypassword
echo "inserting 1_create_tables"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < ../starter/db/1_create_tables.sql

echo "inserting 2_seed_users"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < ../starter/db/2_seed_users.sql

echo "inserting 3_seed_tokens"
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < ../starter/db/3_seed_tokens.sql
