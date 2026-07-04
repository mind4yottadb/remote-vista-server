docker stop  mind-rvs
docker container rm mind-rvs
docker image build --progress=plain -t mind-rvs .
docker run -d --init -p 10000:10000 --name=mind-rvs mind-rvs
docker start mind-rvs