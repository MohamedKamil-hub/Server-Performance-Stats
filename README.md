# Server-Performance-Stats

A lightweight Bash script to analyze and display key performance metrics on Linux servers. Perfect for quick diagnostics, monitoring, and troubleshooting resource usage.
i will be adding new features so it can be more universal, my intend is that this works in the 3 main linux families.
project URL https://roadmap.sh/projects/server-stats
Prerequisites

# Server Stats Script

A comprehensive bash script for monitoring Linux server performance and system statistics.

## 📋 Usage Instructions

### Prerequisites
- Linux system (tested on Debian, Ubuntu, Mint, RHEL, CentOS, SUSE)
- Bash shell
- Root/sudo access (recommended for full functionality)

### Installation


# Clone the repository
git clone https://github.com/MohamedKamil-hub/Server-Performance-Stats


cd Server-Performance-Stats

# Make the script executable
chmod +x server-stats.sh
# Run directly
./server-stats.sh

# Or make it available system-wide
sudo cp server-stats.sh /usr/local/bin/server-stats
server-stats

Output Interpretation

The script provides the following information:

    CPU Usage: Total system CPU utilization percentage

    Memory Usage: Total, used, free memory and usage percentage

    Disk Usage: Root partition usage statistics

    Top Processes: Top 5 processes by CPU and memory usage

    System Info: OS version, uptime, load average, logged-in users

    Security: Recent failed login attempts (the default is 1 hour) 


# Example Output
=== Server Performance Stats ===
Last update: vie 26 sep 2025 15:19:02 CEST

=== CPU Usage ===
Total CPU Usage: 5,90 %

=== Memory Usage ===
Total Memory: 7859 MB
Used Memory: 5731 MB  
Free Memory: 862 MB
Memory Usage: 72,92 %

=== Disk Usage ===
Total Disk: 116,32 GB
Used Disk: 27,20 GB
Free Disk: 83,17 GB
Disk Usage: 25% %

=== Top 5 Processes by CPU Usage ===
2801 16.7 /usr/lib/firefox/firefox
294503 13.3 /usr/lib/firefox/firefox-bin
2902 6.6 /usr/lib/firefox/firefox-bin
1217 3.7 /usr/lib/xorg/Xorg
214660 2.2 /usr/lib/firefox/firefox-bin

=== Top 5 Processes by Memory Usage ===
294503 11.8 /usr/lib/firefox/firefox-bin
232071 11.7 /usr/lib/firefox/firefox-bin
2801 6.2 /usr/lib/firefox/firefox
214660 4.9 /usr/lib/firefox/firefox-bin
204477 4.7 /usr/lib/firefox/firefox-bin

=== Additional System Information ===
OS : Linux Mint 22.2 (Zara)
Uptime: up 2 days, 23 hours, 13 minutes
Load Average: 1,02, 0,85, 0,96
Logged-in Users: user-pc 

=== Recent Failed Login Attempts ===
2025-09-21T21:56:50.524733+02:00 pc-mint lightdm: pam_unix(lightdm:auth): authentication failure; logname= uid=0 euid=0 tty=:1 ruser= rhost=  user=user-pc
2025-09-24T13:03:54.787604+02:00 pc-mint lightdm: pam_unix(lightdm:auth): authentication failure; logname= uid=0 euid=0 tty=:1 ruser= rhost=  user=user-pc
2025-09-25T18:41:22.453708+02:00 pc-mint su: pam_unix(su:auth): authentication failure; logname= uid=1000 euid=0 tty=/dev/pts/1 ruser=user-pc rhost=  user=root
2025-09-26T12:38:53.930187+02:00 pc-mint su: pam_unix(su:auth): authentication failure; logname= uid=1000 euid=0 tty=/dev/pts/1 ruser=user-pc rhost=  user=root
2025-09-26T13:08:25.857926+02:00 pc-mint sudo: pam_unix(sudo:auth): conversation failed

=== End of Report ===
