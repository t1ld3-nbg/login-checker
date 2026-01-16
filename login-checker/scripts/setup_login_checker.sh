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
chmod +x "$LOGIN_CHECKER_SCRIPT"

# Create and restrict log file
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"
chown root:root "$LOG_FILE"


# PAM access to SSH
PAM_SSHD="/etc/pam.d/sshd"
if [[ -f "$PAM_SSHD" ]] && ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_SSHD"; then
	echo "session optional pam_exec.so $LOGIN_CHECKER_SCRIPT" >> "$PAM_SSHD"
fi

# PAM access to console login
PAM_LOGIN="/etc/pam.d/login"
if [[ -f "$PAM_LOGIN" ]] && ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_LOGIN"; then
	echo "session optional pam.exec.so $CHECKER_SCRIPT" >> "$PAM_LOGIN"
fi

# PAM access to GUI logins

# GNOME
PAM_GNOME="/etc/pam.d/gdm-password"
if [[ -f "$PAM_GNOME" ]] && ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_GNOME"; then
	echo "session optional pam_exec.se $LOGIN_CHECKER_SCRIPT" >> "$PAM_GNOME"
fi

# LightDM
PAM_LIGHT="/etc/pam.d/lightdm"
if [[ -f "$PAM_LIGHT" ]] && ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_LIGHT"; then
        echo "session optional pam_exec.se $LOGIN_CHECKER_SCRIPT" >> "$PAM_LIGHT"
fi

#SDDM
PAM_SDDM="/etc/pam.d/sddm"
if [[ -f "$PAM_SDDM" ]] && ! grep -q "$LOGIN_CHECKER_SCRIPT" "$PAM_SDDM"; then
        echo "session optional pam_exec.se $LOGIN_CHECKER_SCRIPT" >> "$PAM_SDDM"
fi


echo "The one-time setup is completed! Login checker will now automatically log all logins."
