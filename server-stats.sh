cat server-stats.sh 
#!/bin/bash
# server-stats.sh
# Author: Mohamed Kamil El Kouarti
# Last update: Thu Sep 25 2025

# memory USED
used=$(free -m | awk 'NR==2 { print $3 }')

#memory total
total=$(free -m | awk 'NR==2 { print $2 }')


# memory (FREE) MB
free_mem=$(free -m | awk 'NR==2 {print $4}')

#DISK USAGE

#FREE
free_disk=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
used_disk=$(df -h / | awk 'NR==2 {print $3}' | sed 's/G//')
percentage=$(df -h / | awk 'NR==2 {print $5}')

#TOTAL CPU USAGE

total_cpu=$(top -b -n1 | awk '/%Cpu/ {for(i=1;i<NF;i++) if($i=="id,"){gsub(",";"."$(i-1)); printf "%.2f", 100 - $(i-1)}}') 

top_5_cpu=$(ps aux --sort=-%cpu | awk 'NR>1 &&  NR<=6 {print $2, $3, $11}')

top_5_mem=$(ps aux --sort=-%mem | awk 'NR>1 && NR<=6 {print $2, $3, $11}')

##os name and version
os_name=$(lsb_release -d | awk -F"\t" '{print $2}')

uptime=$(uptime -p)


users=$(who | awk '{print $1}')

load_average=$(uptime | awk '{print $(NF-2), $(NF -1), $NF}')

failed_logs_j=$(journalctl --since "1 hour ago" | grep -i "pam_unix.*fail")



cat <<EOF
=== Server Performance Stats ===
Last update: Thu Sep 25 2025

=== CPU Usage ===
Total CPU Usage: $total_cpu %

=== Memory Usage ===
Total Memory: $((used + free_mem)) MB
Used Memory: $used MB
Free Memory: $free_mem MB
Memory Usage: $(awk "BEGIN {printf \"%.2f\", $used / ($used + $free) * 100}") %

=== Disk Usage ===
Total Disk: $((free_disk + used_disk)) GB
Used Disk: $used_disk GB
Free Disk: $free_disk GB
Disk Usage: $percentage 

=== Top 5 Processes by CPU Usage ===
$top_5_cpu

=== Top 5 Processes by Memory Usage ===
$top_5_mem

=== Additional System Information ===
OS Version: $os_name
Uptime: $uptime
Load Average: $load_average
Logged-in Users: $users
Recent Failed Login Attempts:
$failed_logs_j
...

=== End of Report ===
EOF
user-pc@pc-mint:~$ cat server-stats1.sh 
#!/bin/bash
# server-stats.sh
# Author: Mohamed Kamil El Kouarti
# Last update: Thu Sep 25 2025

# memory USED
used=$(free -m | awk 'NR==2 { print $3 }')

#memory total
total=$(free -m | awk 'NR==2 { print $2 }')

# memory (FREE) MB
free_mem=$(free -m | awk 'NR==2 {print $4}')

#DISK USAGE

#FREE
free_disk=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
used_disk=$(df -h / | awk 'NR==2 {print $3}' | sed 's/G//')
percentage=$(df -h / | awk 'NR==2 {print $5}')

#TOTAL CPU USAGE - FIXED
total_cpu=$(top -b -n1 | awk '/%Cpu/ {for(i=1;i<=NF;i++) if($i=="id,") {printf "%.2f", 100 - $(i-1)}}')

top_5_cpu=$(ps aux --sort=-%cpu | awk 'NR>1 && NR<=6 {print $2, $3, $11}')

top_5_mem=$(ps aux --sort=-%mem | awk 'NR>1 && NR<=6 {print $2, $4, $11}')  # Changed $3 to $4 for memory percentage

##os name and version
os_name=$(lsb_release -d | awk -F"\t" '{print $2}')

uptime=$(uptime -p)

users=$(who | awk '{print $1}' | sort -u | tr '\n' ' ')  # Get unique users

load_average=$(uptime | awk -F'load average:' '{print $2}' | sed 's/^ *//')  # Fixed load average extraction

failed_logs_j=$(journalctl --since "1 hour ago" 2>/dev/null | grep -i "pam_unix.*fail" | head -5)  # Added error suppression and limit

# Calculate memory usage percentage correctly
memory_usage=$(awk "BEGIN {printf \"%.2f\", $used / $total * 100}")

cat <<EOF
=== Server Performance Stats ===
Last update: $(date)

=== CPU Usage ===
Total CPU Usage: $total_cpu %

=== Memory Usage ===
Total Memory: $total MB
Used Memory: $used MB
Free Memory: $free_mem MB
Memory Usage: $memory_usage %

=== Disk Usage ===
Total Disk: $((free_disk + used_disk)) GB
Used Disk: $used_disk GB
Free Disk: $free_disk GB
Disk Usage: $percentage 

=== Top 5 Processes by CPU Usage ===
$top_5_cpu

=== Top 5 Processes by Memory Usage ===
$top_5_mem

=== Additional System Information ===
OS Version: $os_name
Uptime: $uptime
Load Average: $load_average
Logged-in Users: $users
Recent Failed Login Attempts:
$failed_logs_j
...

=== End of Report ===
EOF
