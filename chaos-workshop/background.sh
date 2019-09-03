#!/bin/bash
mkdir /chaos-workshop
cd /chaos-workshop
git clone https://github.com/jyee/memebook.git .
date > lastrun.txt

kubectl apply -f kubernetes/memebook.yaml
kubectl apply -f kubernetes/doggo.yaml
kubectl apply -f kubernetes/lolcat.yaml
kubectl apply -f kubernetes/redis-master.yaml
kubectl apply -f kubernetes/redis-slave.yaml
kubectl apply -f kubernetes/traffic_generator.yaml
