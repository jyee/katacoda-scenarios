#!/bin/bash
echo "Setting up environments"

if [ (hostname) == "node01" ]; then
  bash -c "apt-get update &&
    apt-get install golang-go stress-ng &&
    go get github.com/tylertreat/comcast"
fi


