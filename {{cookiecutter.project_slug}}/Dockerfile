FROM python:3.6-stretch

ENV PYTHONUNBUFFERED 1

RUN apt-get update -y && apt-get install -y vim lsof less
RUN apt-get install -y --no-install-recommends postgresql-client && rm -rf /var/lib/apt/lists/*

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD . /code/

EXPOSE 8000
