#!/usr/bin/bash

# This script shall be executed as part of the Arch Linux installation
# routine. Right before the "reboot" command.

password_status=$(passwd -S root | awk '{print $2}')

if [[ "$password_status" == "P" ]]; then
	echo "Password for root is set."
else
	echo "WARNING: User root does not have a password set."
fi

exit 0
