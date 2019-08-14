#!/bin/bash
mkdir /chaos-workshop
git clone https://github.com/jyee/distributed-tracing-with-apm-workshop /chaos-workshop
cd /chaos-workshop
git fetch origin k8s-golang-workshop
git checkout k8s-golang-workshop
