#!/bin/bash

# Clone the Memebook git repo (output to error.txt if something goes wrong)
git clone https://github.com/jyee/memebook.git

# Move the Kubernetes bits out of the project, then delete the project (we don't need the code).
echo "Getting Memebook Kubernetes manifests" >> status.txt
mv memebook/kubernetes . && rm -r memebook

echo "Node01: apt update" >> status.txt
ssh -oStrictHostKeyChecking=no node01 "apt-get update"
echo "Node01: apt install stress-ng" >> status.txt
ssh -oStrictHostKeyChecking=no node01 "apt-get -y install stress-ng"
echo "Node01: apt install golang-go" >> status.txt
ssh -oStrictHostKeyChecking=no node01 "apt-get -y install golang-go"
echo "Node01: go get comcast" >> status.txt
ssh -oStrictHostKeyChecking=no node01 "export GOPATH=/root/gopath && go get github.com/tylertreat/comcast && ln -s /root/gopath/bin/comcast /usr/bin/"

# Wait until we have a running kubeadm
# This is a Katacoda tool.
launch.sh

echo "Applying Kubernetes manifests" >> status.txt
kubectl apply -f kubernetes/memebook.yaml
kubectl apply -f kubernetes/doggo.yaml
kubectl apply -f kubernetes/lolcat.yaml
kubectl apply -f kubernetes/redis-master.yaml
kubectl apply -f kubernetes/redis-slave.yaml

echo "finished" >> status.txt
