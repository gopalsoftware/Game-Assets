#!/bin/bash

# Customize these values if needed
INTERFACE="wlan0"
STATIC_IP="192.168.43.100"
GATEWAY="192.168.43.1"
NETMASK="24"  # equivalent to 255.255.255.0
DNS="8.8.8.8"

echo "[+] Setting static IP $STATIC_IP on $INTERFACE..."

# Flush existing IPs
sudo ip addr flush dev $INTERFACE

# Set new static IP
sudo ip addr add $STATIC_IP/$NETMASK dev $INTERFACE

# Set default gateway
sudo ip route add default via $GATEWAY

# Set DNS resolver
echo "nameserver $DNS" | sudo tee /etc/resolv.conf > /dev/null

echo "[+] Static IP configured. You can now try SSH at $STATIC_IP"