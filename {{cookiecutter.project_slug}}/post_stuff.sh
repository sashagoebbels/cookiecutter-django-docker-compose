docker-compose up -d
sleep 5 # PostgreSQL in a docker container tends to be a bit slow in startup
#cid=`docker container ls | grep {{ cookiecutter.project_name }}_web | awk '{ print $1 }'`
#docker exec $cid python manage.py migrate
docker-compose run --rm web python manage.py migrate
docker-compose run --rm web python manage.py createsuperuser
