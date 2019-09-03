#!/bin/bash
# Ensure we're running a new build (can look at this to verify)
date > lastrun.txt

# Clone the Memebook git repo (output to error.txt if something goes wrong)
git clone https://github.com/jyee/memebook.git &> error.txt

# Move the Kubernetes bits out of the project, then delete the project (we don't need the code).
mv memebook/kubernetes . && rm -r memebook

kubectl apply -f kubernetes/memebook.yaml
kubectl apply -f kubernetes/doggo.yaml
kubectl apply -f kubernetes/lolcat.yaml
kubectl apply -f kubernetes/redis-master.yaml
kubectl apply -f kubernetes/redis-slave.yaml
kubectl apply -f kubernetes/traffic_generator.yaml
