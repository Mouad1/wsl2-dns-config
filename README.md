# WSL2 DNS Configuration Script

## Overview
This script facilitates the configuration of DNS settings within a WSL2 environment. It modifies the `/etc/wsl.conf` to disable automatic generation of `/etc/resolv.conf`, and establishes a custom `/etc/resolv.conf` with a user-specified DNS server address.

## Operation
1. **Initial Script Execution**:
   - Updates `/etc/wsl.conf` to disable automatic DNS configuration.
   - Instructs user to restart WSL2.

2. **WSL2 Restart**:
   - User exits WSL2, runs `wsl --shutdown` in PowerShell, and reopens WSL2.

3. **Script Re-execution with DNS Argument**:
   - Script verifies `/etc/resolv.conf`, removes if symbolic link.
   - Creates custom `/etc/resolv.conf` with user-specified DNS server.
   - Instructs user to restart WSL2 again.

4. **Final WSL2 Restart**:
   - User performs another `wsl --shutdown` and reopens WSL2 to apply DNS settings.

## Usage

1. Make the script executable with this command: `chmod +x update_dns.sh`
2. Run the script once without arguments: `./update_dns.sh`
3. Follow the instructions to restart WSL2 from PowerShell with `wsl --shutdown`.
4. Re-open WSL and run the script again with local DNS server address as an argument: Example: `./dns_init.sh 172.27.57.3`
   - Open your Command Prompt from the Start menu.
   - Type `ipconfig/all` into your command prompt and press Enter.
   - Look for the field labeled “DNS Servers.” The first address is the primary DNS server, and the next address is the secondary DNS server.
5. Follow the instructions to restart WSL2 again from PowerShell with `wsl --shutdown`.
6. Start a new Linux prompt in WSL2.

Now, your WSL2 environment should be using the specified DNS server for name resolution.


