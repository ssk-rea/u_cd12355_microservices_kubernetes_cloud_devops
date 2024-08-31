import logging
import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db_username = os.environ["DB_USERNAME"]
db_password = os.environ["DB_PASSWORD"]
db_host = os.environ.get("DB_HOST", "127.0.0.1")
db_port = os.environ.get("DB_PORT", "5432")
db_name = os.environ.get("DB_NAME", "postgres")

str_out = f"""
            \n db_username: {db_username}
            \n db_password: {db_password}
            \n db_host: {db_host}
            \n db_port: {db_port}
            \n db_name: {db_name}
        """

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = f"postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}"

db = SQLAlchemy(app)
app.logger.info(str_out)

app.logger.setLevel(logging.DEBUG)