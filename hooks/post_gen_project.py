#!/usr/bin/env python3

import sys, os

os.system("docker-compose build")
os.system("docker-compose run --rm web django-admin.py startproject {{ cookiecutter.project_name }} .")

file = open("{{ cookiecutter.project_slug }}/settings.py", "r")
from_text = """        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),"""
to_text = """        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,"""
content = file.read().replace(from_text, to_text)
file.close()
file = open("{{ cookiecutter.project_slug }}/settings.py", "w")
file.write(content)
file.close()
