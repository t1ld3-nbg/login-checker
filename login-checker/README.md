LOGIN CHECKER - a project assignment for the course "Applied Script".

PURPOSE
The LOGIN CHECKER logs every user login with time/date, username, terminal, and IP address. \
From a cybersecurity point-of-view this script can help an administrator and/or organizations keep their systems secure and their users accountable.

FUNCTIONALITY 
-Logs SSH and local console, as well as most desktop, logins automatically.
-Saves logs in the /var/log folder.
-Uses PAM to be triggered by each specific login, meaning no constant background loops.

SYSTEM REQUIREMENTS
-Linux OS
-BASH shell
-Root access for the first setup

INSTRUCTIONS
1, Clone and open this repository:
   git clone https://github.com/t1ld3-nbg/applied_script_projektarbete
   cd login-checker

2, Run setup script as root user:
   sudo bash setup_login_checker.sh

3, The LOGIN CHECKER while run continously after setup is complete.
