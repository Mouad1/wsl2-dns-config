#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Turn off generation of /etc/resolv.conf
echo "[network]" > /etc/wsl.conf
echo "generateResolvConf = false" >> /etc/wsl.conf
echo "Step 1 complete: /etc/wsl.conf has been updated."

# Inform user about step 2
echo "Please perform Step 2: Restart the WSL2 Virtual Machine."
echo "Exit all of your Linux prompts and run the following Powershell command:"
echo "wsl --shutdown"
echo "Then, re-open WSL and re-run this script with the DNS address as argument."
echo "Example: ./dns_init.sh 172.27.57.3"

# If DNS address is provided, proceed to step 3
if [ "$1" ]; then
    # Step 3: Create a custom /etc/resolv.conf
    cd /etc
    if [ -L resolv.conf ]; then
        rm resolv.conf
    fi
    echo "nameserver $1" > resolv.conf
    echo "Step 3 complete: /etc/resolv.conf has been updated with nameserver $1."

    # Inform user about steps 4 and 5
    echo "Please perform Step 4: Restart the WSL2 Virtual Machine again using the Powershell command: wsl --shutdown"
    echo "Then, perform Step 5: Start a new Linux prompt."
else
    echo "No DNS address provided. Please re-run the script with the DNS address as argument after restarting WSL2."
fi
