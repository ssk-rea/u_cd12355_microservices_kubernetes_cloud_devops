FROM python:3.10-slim-buster

RUN apt update
RUN apt install -y build-essential libpq-dev

WORKDIR /src

COPY ./starter/analytics/requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 5153

COPY ./analytics .

CMD python app.py
