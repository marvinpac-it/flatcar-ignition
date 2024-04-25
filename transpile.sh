#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Please provide the server name and the IP address as arguments."
    echo 'Example: $ bash transpile.sh flatcar01 192.168.77.101 > ignition.json'
    exit 1
fi

# Determine the name of the first non-loopback interface
non_loopback_interface=$(ip -o link show | awk '!/^[0-9]*: lo:/' | awk '{sub(/:$/, "", $2); print $2; exit}')

sed -e "s/HOSTNAME/$1/" -e "s/IPADDRESS/$2/" -e "s/INTERFACE/$non_loopback_interface/" "$(dirname "$0")/cl.yaml" | docker run --rm -i quay.io/coreos/butane:latest
