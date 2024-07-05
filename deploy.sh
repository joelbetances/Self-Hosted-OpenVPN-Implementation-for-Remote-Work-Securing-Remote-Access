#!/bin/bash

# Enable and start the OpenVPN service
sudo systemctl enable openvpn@server
sudo systemctl start openvpn@server
