# CSC8110

## Task 1
`docker pull nclcloudcomputing/javabenchmarkapp`  
`docker run -p 8080:8080 nclcloudcomputing/javabenchmarkapp`  
`localhost:8080/primecheck`  

## Task 2
`cd projects/CSC8110`  
`git pull`  

`docker swarm init`  
`docker stack deploy -c docker-compose.yaml Task2`

cAdvisor: `localhost:8081`  
Visualizer: `localhost:8082`  

## Task 3
