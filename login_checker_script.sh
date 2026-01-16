#!/bin/bash
# Login Checker logs all logins with date, time, user, and IP-address.

# Check for Linux OS otherwise exit script.
if [[ "$(uname)" != "Linux" ]]; then
    echo "Error: This script only runs on Linux." >&2
    exit 1
fi


# Saves the log output to a log file.
LOG_FILE="/var/log/login_checker.log"

# Using PAM to trigger script att login.

# PAM username
USERNAME="${PAM_USER:-$USER}

# PAM terminal
TERMINAL="${PAM_TTY:-$(tty))"

# PAM IP: Remote host IP.
if [[ -n "$PAM_RHOST" && "$PAM_RHOST" != "(:0)" ]]; then
	IP_ADDRESS="$PAM_RHOST"
else
	#Local login, check non-PAM  IP.
	IP_ADDRESS=$(ip a show scope global | awk '/inet / {print $2}' | cut -d/ -f1
fi


# Log file output.
{
	echo "$(date '+%Y-%m-%d %H:%M:%S')   User $USERNAME logged in from $TERMINAL \
using IP address $IP_ADDRESS"
} >> $LOG_FILE"




