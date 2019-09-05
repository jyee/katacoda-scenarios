#!/bin/bash

# Clone the Memebook git repo (output to error.txt if something goes wrong)
git clone https://github.com/jyee/memebook.git &> git-messages.txt

# Move the Kubernetes bits out of the project, then delete the project (we don't need the code).
echo "Getting Memebook Kubernetes manifests" >> status.txt
mv memebook/kubernetes . && rm -r memebook

echo "Applying Kubernetes manifests" >> status.txt
kubectl apply -f kubernetes/memebook.yaml
kubectl apply -f kubernetes/doggo.yaml
kubectl apply -f kubernetes/lolcat.yaml
kubectl apply -f kubernetes/redis-master.yaml
kubectl apply -f kubernetes/redis-slave.yaml

echo "Installing tools on host node (apt)" >> status.txt
ssh -oStrictHostKeyChecking=no node01 "apt-get update && apt-get -y install golang-go stress-ng"

#echo "Installing tools on host node (go)" >> status.txt
#ssh -oStrictHostKeyChecking=no node01 "apt-get update && apt-get -y install golang-go stress-ng"

echo "finished" >> status.txt
