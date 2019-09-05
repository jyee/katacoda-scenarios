#!/bin/bash

# Clone the Memebook git repo (output to error.txt if something goes wrong)
git clone https://github.com/jyee/memebook.git 2> error.txt

# Move the Kubernetes bits out of the project, then delete the project (we don't need the code).
mv memebook/kubernetes . && rm -r memebook

kubectl apply -f kubernetes/memebook.yaml
kubectl apply -f kubernetes/doggo.yaml
kubectl apply -f kubernetes/lolcat.yaml
kubectl apply -f kubernetes/redis-master.yaml
kubectl apply -f kubernetes/redis-slave.yaml

ssh node01 -c "apt-get update &&
  apt-get install -y golang-go stress-ng"
