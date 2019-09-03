#!/bin/bash
source <(kubectl completion bash)
echo [[HOST_IP]] >> /chaos-workshop/hostip
cd /chaos-workshop
