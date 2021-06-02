docker build --tag gauge --no-cache .
docker run --rm --env-file .env --publish 8000:8000 --name gauge gauge
docker stop gauge
docker exec -it gauge /bin/bash

https://console.developers.google.com/project
