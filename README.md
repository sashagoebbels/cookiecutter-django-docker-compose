# Django + docker-compose

Bootstrap your django project inside docker with PostgreSQL support.

## What will I get?

* Dockerfile for Django development
* docker-compose.yml file with 2 services: web (Django) and db (PostgreSQL)
* .gitignore file with support for python and Jetbrains software
* .gitlab and .github directories with issue and pull/merge request templates in each

## Usage

### Prerequisite

Install cookiecutter:

```shell
pip install cookiecutter
```

### Create your project

```shell
cookiecutter https://gitlab.com/cookiecutter-templates/django-docker-compose.git
```

Bootstrapping will take some time because the script has to wait for the PostgreSQL container to come up properly to spin up the django container.

What it does:
* Ask you for a project name, slug and description as well as an app name.
* Build the images
* Run ```django-admin startproject``` with the project name provided
* Patch the PostgreSQL connection information into ```settings.py```
* Append a path of ```/``` for ```LOGIN_REDIRECT_URL``` and ```LOGOUT_REDIRECT_URL``` at the end of ```settings.py```
* Run ```manage.py startapp``` with the app name provided
* Waits 25 seconds for the PostgreSQL container to come up properly and run ```manage.py migrate```
* Run ```manage.py createsuperuser``` (will ask you interactively for admin user settings)
* Shut down all the cvontainers

To spin up the project after this, change into the project directory and run:

```shell
docker-compose up -d
```
