# CSC8110
All groups of commands assume a root of `/Assignment/`
## Task 1
`docker pull nclcloudcomputing/javabenchmarkapp`  
`docker run -p 8080:8080 nclcloudcomputing/javabenchmarkapp`  
`localhost:8080/primecheck`  

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
`java -jar target/cadvisor-scrape-1.0-jar-with-dependencies.jar`
  
`docker build -t greenking2000:cadvisor-scraper`  
`docker push greenking2000:cadvisor-scraper`

## Task 4
`docker pull greenking2000:cadvisor-scraper`


`mongo-express --url mongodb://127.0.0.1:27017`


## Quick
`docker swarm leave --force && docker swarm init && docker stack deploy -c docker-compose.yaml CSC8110`
  
If docker dies:  
`sudo systemctl stop docker`  
`sudo rm -r /var/lib/docker/swarm`  
`sudo systemctl start docker`

`sudo systemctl stop docker && sudo rm -r /var/lib/docker/swarm && sudo systemctl start docker`