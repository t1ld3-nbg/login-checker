#!/bin/bash
# Login Checker logs all logins with date, time, user, and IP-address.

<<<<<<< HEAD
# Check for Linux OS otherwise exit script
if [[ "$(uname)" != "Linux" ]]; then
    echo "Error: This script only runs on Linux." >&2
    exit 1
fi

# Saves the log output to a log file.
LOG_FILE="/var/log/login_checker.log"

# Variable for IP-address.
IP_ADDRESS=$(ip a show scope global | awk '/inet / {print $2}' | \
cut -d/ -f1)

# Logs time and date as well as which user, 
#	and their terminal and IP address.
=======
# Saves the log output to a log file.
#LOG_FILE="/var/log/login_checker.log"

# Checks for file and file path, creates them if they don't already exist.
#[[ -e $LOG_FILE ]] || touch $LOG_FILE 

 Logs time and date as well which user logged in using what terminal.
#>>>>>>> 3bc5294 (Checks for file + path for storing output of the script. Creates file + path if the don't already exist.)
{
	echo "$(date '+%Y-%m-%d %H:%M:%S')  User $USER logged in from \
$(tty) using IP address $IP_ADDRESS"
} >> "$LOG_FILE"
#<<<<<<< HEAD
exit 0
=======
exit 0










>>>>>>> 3bc5294 (Checks for file + path for storing output of the script. Creates file + path if the don't already exist.)
