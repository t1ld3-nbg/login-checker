#!/bin/bash
# One-time setup for Login Checker
# Needs sudo to run

LOGIN_CHECKER_SCRIPT="/usr/local/bin/login_checker_script.sh"
LOG_FILE="/var/log/login_checker.log"


# Ask for sudo if needed
if [[ "$EUID" -ne 0 ]]; then
	echo "Kindly run this script using the 'sudo' command."
	exit 1
fi

# Copy login_checker_script to /usr/local/bin/ and make it executable
cp "./login_checker_script.sh" "LOGIN_CHECKER SCRIPT"
chmod +x "LOGIN_CHECKER_SCRIPT"

# Create and restrict log file
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"
chown root:root "$LOG_FILE"


# Give PAM access to SSH
PAM_SSHD="/etc/pam.d/sshd"
if ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_SSHD"; then
	echo "session optional pam_exec.so $LOGIN_CHECKER_SCRIPT" >> "$PAM_SSHD"
fi

# Give PAM access to console login
PAM_LOGIN="/etc/pam.d/login"
if ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_LOGIN"; then
	echo "session optional pam.exec.so $CHECKER_SCRIPT" >> "$PAM_LOGIN"
fi

echo "The one-time setup is completed! Login checker will now automatically log all logins."
