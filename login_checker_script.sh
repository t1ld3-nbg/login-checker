#!/bin/bash
# Login Checker logs all logins with date, time and user.

# Saves the log output to a log file.
LOG_FILE="/var/log/login_checker.log"

# Logs time and date as well as which user logged in using what terminal.
{
	echo "$(date '+%Y-%m-%d %H:%M:%S')  User $USER logged in from $(tty)"
} >> "$LOG_FILE"
exit 0





