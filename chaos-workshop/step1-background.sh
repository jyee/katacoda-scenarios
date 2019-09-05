#!/bin/bash
# Give the application some time to start, then generate traffic.
kubectl apply -f kubernetes/traffic_generator.yaml
