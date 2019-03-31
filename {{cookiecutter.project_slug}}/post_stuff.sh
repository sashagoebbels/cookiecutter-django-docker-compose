docker-compose up -d
sleep 10 # PostgreSQL in a docker container tends to be a bit slow in startup
docker-compose run --rm web python manage.py migrate
docker-compose run --rm web python manage.py createsuperuser
docker-compose down
