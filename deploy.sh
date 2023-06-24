docker build -t suyashs52/multi-client:latest -t suyashs52/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t suyashs52/multi-server:latest -t suyashs52/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t suyashs52/multi-worker:latest -t suyashs52/multi-worker:$SHA  -f ./woker/Dockerfile ./worker
docker push suyashs52/multi-client:latest
docker push suyashs52/multi-server:latest
docker push suyashs52/multi-worker:latest

docker push suyashs52/multi-client:$SHA 
docker push suyashs52/multi-server:$SHA 
docker push suyashs52/multi-worker:$SHA 
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=suyashs52/multi-server:$SHA 
kubectl set image deployments/client-deployment client=suyashs52/multi-client:$SHA 
kubectl set image deployments/worker-deployment worker=suyashs52/multi-worker:$SHA 




