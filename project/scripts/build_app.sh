# Update the local package index with the latest packages from the repositories
apt update

# Install a couple of packages to successfully install postgresql server locally
apt install build-essential libpq-dev

# Update python modules to successfully build the required modules
pip install --upgrade pip setuptools wheel

pip install -r analytics/requirements.txt

export DB_USERNAME=myuser
export DB_PASSWORD=mypassword
export DB_HOST=127.0.0.1
export DB_PORT=5433
export DB_NAME=mydatabase

python analytics/app.py

export BASE_URL=127.0.0.1:5153
curl $BASE_URL/api/reports/daily_usage

curl $BASE_URL/api/reports/user_visits