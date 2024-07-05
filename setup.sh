#!/bin/bash

# Update and install OpenVPN
sudo apt-get update
sudo apt-get install -y openvpn easy-rsa

# Set up the CA and server certificates
make-cadir ~/openvpn-ca
cd ~/openvpn-ca
source vars
./clean-all
./build-ca
./build-key-server server
./build-dh
openvpn --genkey --secret keys/ta.key

# Generate client certificates
./build-key client1

# Copy certificates and keys
cp keys/ca.crt keys/server.crt keys/server.key keys/ta.key keys/dh2048.pem /etc/openvpn
