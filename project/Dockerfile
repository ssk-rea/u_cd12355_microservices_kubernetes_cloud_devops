# Start from a simple python image
FROM python:3.10-slim-buster

# Install build requirements
RUN apt update
RUN apt install -y build-essential libpq-dev

# Working directory for the app
WORKDIR /src

# Copy python requirements file
COPY ./starter/analytics/requirements.txt requirements.txt

# Install python dependencies
RUN pip install -r requirements.txt

# Expose port to access the app
EXPOSE 5153

# Copy the analytics code
COPY ./starter/analytics .

# Start the application
CMD python app.py
