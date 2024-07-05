# Troubleshooting Guide

This guide provides solutions to common issues encountered during the installation and configuration of OpenVPN.

## Common Issues

### Issue: OpenVPN service fails to start

- **Solution**: Check the OpenVPN logs for errors:
    ```bash
    sudo journalctl -u openvpn@server
    ```

### Issue: Clients cannot connect to the VPN

- **Solution**: Ensure the server's public IP address is correctly specified in the client configuration file.

### Issue: No internet access through VPN

- **Solution**: Enable IP forwarding and configure NAT on the server:
    ```bash
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
    ```

### Issue: Certificate verification failed

- **Solution**: Ensure the client and server are using the correct and matching certificates.
