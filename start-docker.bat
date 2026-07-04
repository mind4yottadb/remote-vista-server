docker stop  mind-rvs
docker container rm mind-rvs
docker compose up --detach --force-recreate --build
