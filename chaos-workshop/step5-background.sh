#!/bin/bash
# Install some tools to help degrade the environment.

# Install comcast
apt-get update
apt-get install go
export GOPATH=/root/gopath
go get github.com/tylertreat/comcast
ln -s /root/gopath/bin/comcast /usr/bin/

# Install stress-ng
apt-get install stress-ng
