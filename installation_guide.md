# Installation Guide

This guide will walk you through the steps to install and configure OpenVPN on your server.

## Prerequisites

- A server with a public IP address
- Basic knowledge of Linux command line
- SSH access to the server

## Steps

1. **Update your server**:
    ```bash
    sudo apt-get update
    sudo apt-get upgrade
    ```

2. **Install OpenVPN and Easy-RSA**:
    ```bash
    sudo apt-get install -y openvpn easy-rsa
    ```

3. **Set up the CA and generate certificates**:
    ```bash
    make-cadir ~/openvpn-ca
    cd ~/openvpn-ca
    source vars
    ./clean-all
    ./build-ca
    ./build-key-server server
    ./build-dh
    openvpn --genkey --secret keys/ta.key
    ```

4. **Generate client certificates**:
    ```bash
    ./build-key client1
    ```

5. **Copy the necessary files**:
    ```bash
    sudo cp keys/ca.crt keys/server.crt keys/server.key keys/ta.key keys/dh2048.pem /etc/openvpn
    ```

6. **Configure the OpenVPN server**:
    Edit the `/etc/openvpn/server.conf` file with your preferred settings.

7. **Start the OpenVPN service**:
    ```bash
    sudo systemctl enable openvpn@server
    sudo systemctl start openvpn@server
    ```

## Client Setup

1. **Copy client configuration files**:
    Copy the `client.ovpn`, `ca.crt`, `client.crt`, and `client.key` files to the client machine.

2. **Install the OpenVPN client**:
    Follow the instructions for your operating system to install the OpenVPN client.

3. **Import the client configuration**:
    Import the `client.ovpn` file into your OpenVPN client and connect to the VPN.
