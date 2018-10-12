#!/bin/bash
# 
# Installation of the Hashicorp Consul Service
# 
# Variables - CONSUL_VER

echo "Initalizing Script for Installing Consul"

CONSUL_VER=1.3.0

sudo mkdir -p /srv/hashicorp-consul/src
cd /srv/hashicorp-consul/src

echo "Fetching latest consul binary for linux x64"
curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip
 
echo "Installing consul..."
unzip consul.zip
sudo install consul /usr/bin/consul

echo "Setting consul config directory"
sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d

echo "Installing Consul"
consul -autocomplete-install

echo "Creating structure for hashicorp-cluster..."
DATA_DIR="/srv/hashicorp-consul/cluster"

if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
  echo "Hashicorp directory created: $DATA_DIR"
fi

echo "Cleaning files..."
sudo rm -rf consul.zip

echo "snackramas awaits"