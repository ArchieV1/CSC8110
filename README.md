# CSC8110
All groups of commands assume a root of `/Assignment/`
## Task 1
`docker pull nclcloudcomputing/javabenchmarkapp`  
`docker run -p 8080:8080 nclcloudcomputing/javabenchmarkapp`  
Primecheck: `localhost:8080/primecheck`  

## Task 2
`cd projects/CSC8110`  
`git pull`  

`docker swarm init`  
`docker stack deploy -c docker-compose.yaml CSC8110`

cAdvisor: `localhost:8081`  
Visualizer: `localhost:8082`  

## Task 3
`cd cadvisor-scraper-master`  
`mvn compile assembly:single`  
  
`docker build -t greenking2000/cadvisor-scraper:latest .`  
`docker push greenking2000/cadvisor-scraper:latest`

mongo-express: `localhost:8083`

## Task 4
`docker pull greenking2000/cadvisor-scraper:latest`  
`docker stack deploy -c docker-compose.yaml CSC8110 --with-registry-auth`

  

## Quick
#### Restart swarm
`docker swarm leave --force && docker swarm init && docker stack deploy -c docker-compose.yaml CSC8110` 

#### Restart docker
`sudo systemctl stop docker && sudo rm -r /var/lib/docker/swarm && sudo systemctl start docker`