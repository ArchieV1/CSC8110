# CSC8110
All groups of commands assume a root of `/Assignment/`
## Task 1
`docker pull nclcloudcomputing/javabenchmarkapp`  
`docker run -p 8080:8080 nclcloudcomputing/javabenchmarkapp`  
Primecheck: `http://localhost:8080/primecheck`  

## Task 2
```
docker pull locustio/locust
docker pull mongo
docker pull gcr.io/cadvisor/cadvisor:v0.45.0
docker pull dockersamples/visualizer
```


`cd projects/CSC8110`  
`git pull`  

`docker swarm init`  
`docker stack deploy -c docker-compose.yaml CSC8110`

cAdvisor: `http://localhost:8081`  
Visualizer: `http://localhost:8082`  

## Task 3
Build java project after any changes (On PC)  
`cd cadvisor-scraper-master`  
`mvn compile assembly:single`  
`git push --origin master`
  
`docker ps --no-trunc` (To find container IDs)

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

LocustIO: `http://localhost:8090`
  
## Task 5?
```
terraform init
terraform plan
terraform apply
``` 


## Quick
#### Restart swarm
`docker swarm leave --force && docker swarm init && docker stack deploy -c docker-compose.yaml CSC8110` 

#### Restart docker
`sudo systemctl stop docker && sudo rm -r /var/lib/docker/swarm && sudo systemctl start docker`

## task 5 note
```
tenant_id = "9c5012c9-b616-44c2-a917-66814fbe3e87
subscription_id = "db6c56e5-692e-4891-b8b9-07eaf09b5947
resource_group_name = "csc8110_resource_group
```