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
