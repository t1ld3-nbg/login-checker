#!/bin/bash
# Login Checker logs all logins with date, time and user.

# Saves the log output to a log file.
LOG_FILE="/var/log/login_checker.log"

# Variable for IP-address.
IP_ADDRESS=$(ip a show scope global | awk '/inet / {print $2}' | cut -d/ -f1 | head -n 1)

# Logs time and date as well as which user and their terminal and IP address.
{
	echo "$(date '+%Y-%m-%d %H:%M:%S')  User $USER logged in from $(tty) using IP address $IP_ADDRESS"
} >> "$LOG_FILE"
exit 0





