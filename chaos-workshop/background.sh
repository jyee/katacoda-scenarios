#!/bin/bash
mkdir /chaos-workshop
cd /chaos-workshop
git clone https://github.com/jyee/distributed-tracing-with-apm-workshop.git .
date > lastrun.txt
git fetch origin k8s-autodiscovery
git checkout k8s-autodiscovery

kubectl create secret generic postgres-user --from-literal=token=postgres
kubectl create secret generic postgres-password --from-literal=token=postgres-password

kubectl apply -f k8s-yaml-files/postgres-deploy.yaml
kubectl apply -f k8s-yaml-files/redis-deploy.yaml
kubectl apply -f k8s-yaml-files/pumps-service.yaml
kubectl apply -f k8s-yaml-files/sensors-api.yaml
kubectl apply -f k8s-yaml-files/node-api.yaml
kubectl apply -f k8s-yaml-files/frontend-service.yaml
