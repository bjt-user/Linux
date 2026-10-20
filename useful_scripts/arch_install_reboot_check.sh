#!/usr/bin/bash

# This script shall be executed as part of the Arch Linux installation
# routine. Right before the "reboot" command.
# The script is intended to be executed by root.

function is_package_installed() {
	if pacman -Qs "^${1}$" &>/dev/null; then
		return 0
	fi

	return 1
}

relevant_packages+=(base)
relevant_packages+=(efibootmgr)
relevant_packages+=(grub)
relevant_packages+=(linux)
relevant_packages+=(linux-firmware)
relevant_packages+=(vim)
password_status=$(passwd -S root | awk '{print $2}')
warning_count=0

if [[ "$password_status" == "P" ]]; then
	printf "Password for root is set.\n"
else
	printf "WARNING: User root does not have a password set.\n"
	((warning_count++))
fi

for package in "${relevant_packages[@]}"; do
	if ! is_package_installed "$package"; then
		printf "WARNING: %s is NOT installed.\n" "$package"
		((warning_count++))
	else
		printf "Package %s is installed.\n" "$package"
	fi
done

printf "\nTotal warnings: %d\n" "$warning_count"

if [[ "$warning_count" -eq 0 ]]; then
	printf "You may reboot the system now! Good luck!\n"
fi

exit 0
