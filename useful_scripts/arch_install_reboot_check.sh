#!/usr/bin/bash

# This script shall be executed as part of the Arch Linux installation
# routine. Right before the "reboot" command.
# The script is intended to be executed by root.

function is_package_installed() {
	if pacman -Qs "^${1}$"; then
		return 0
	fi

	return 1
}

password_status=$(passwd -S root | awk '{print $2}')

if [[ "$password_status" == "P" ]]; then
	echo "Password for root is set."
else
	echo "WARNING: User root does not have a password set."
fi

if ! is_package_installed "vim"; then
	echo "WARNGIN: vim is not installed."
fi

exit 0
