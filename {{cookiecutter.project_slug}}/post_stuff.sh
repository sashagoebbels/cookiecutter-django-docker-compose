docker-compose up -d
sleep 5
cid=`docker container ls | grep {{ cookiecutter.project_name }}_web | awk '{ print $1 }'`
docker exec $cid python manage.py migrate
