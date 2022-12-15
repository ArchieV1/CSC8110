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
Build java project after any changes (On PC)  
`cd cadvisor-scraper-master`  
`mvn compile assembly:single`  
`git push --origin master`

(In Azure)  
`git pull`  
`docker build -t greenking2000/cadvisor-scraper:latest .`  
`docker push greenking2000/cadvisor-scraper:latest`

mongo-express: `localhost:8083`

## Task 4
Run Swarm and Scraper under same network  
`docker pull greenking2000/cadvisor-scraper:latest`  
`docker network create --driver overlay --attachable my_network`  

`docker stack deploy -c docker-compose.yaml CSC8110 --with-registry-auth`  
`docker run greenking2000/cadvisor-scraper --network=my_network`
  

## Quick
#### Restart swarm
`docker swarm leave --force && docker swarm init && docker stack deploy -c docker-compose.yaml CSC8110` 

#### Restart docker
`sudo systemctl stop docker && sudo rm -r /var/lib/docker/swarm && sudo systemctl start docker`