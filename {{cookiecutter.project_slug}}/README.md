# {{cookiecutter.project_name}}

{{cookiecutter.project_description}}

## Usage

```shell
docker-compose up -d
```

## manage.py

Access manage.py via

```shell
docker exec web python3 manage.py <command>
```

## Adding requirements

If you update the `requirements.txt`file, the most simple way to update the Python
installation is to rebuild the image via:

```shell
docker-compose stop web
docker-compose build web
docker-compose up -d web
```

## Known problems

On some hosts the PostgreSQL container comes up too slowly. This leads to an
error message in the Python container about the database not being accessible.

If you encounter this pronlem, shut down and restart the Python container with:

```shell
docker-compose stop web
docker-compose up -d web
```

To prevent this from happening again, start both services manually with some delay by:

```shell
docker-compose up -d db

docker-compose up -d web
```