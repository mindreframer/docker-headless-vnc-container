#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# apt-get install software-properties-common
# apt-get install python-software-properties
# add-apt-repository ppa:longsleep/golang-backports
# apt-get update
# apt-get install golang-go
cd /tmp
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
echo "export GOPATH=\$HOME/go" >> /etc/profile
echo "source /etc/profile" >> /headless/.bashrc
