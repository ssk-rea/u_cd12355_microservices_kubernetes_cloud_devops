# Update the local package index with the latest packages from the repositories
echo "Run apt update"
apt update

# Install a couple of packages to successfully install postgresql server locally
echo "Install build requirements"
apt install build-essential libpq-dev

# Update python modules to successfully build the required modules
echo "install pip requirements"
pip install --upgrade pip setuptools wheel

echo "Install app requirements"
pip install -r analytics/requirements.txt

echo "Export DB environment variables"
export DB_USERNAME=myuser
export DB_PASSWORD=mypassword
export DB_HOST=127.0.0.1
export DB_PORT=5433
export DB_NAME=mydatabase

echo "Start the application"
python analytics/app.py