docker build --tag gauge
docker run --rm --env-file .env --publish 8000:8000 --name gauge gauge
docker stop gauge
docker exec -it gauge /bin/sh

https://console.developers.google.com/project
