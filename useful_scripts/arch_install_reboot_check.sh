#!/usr/bin/bash

# This script shall be executed as part of the Arch Linux installation
# routine. Right before the "reboot" command.
# The script is intended to be executed by root.

function print_boxed_string() {
	declare string_length
	string_length=${#1}
	declare box_width
	box_width=$((string_length + 4))
	declare string
	string="$1"

	for ((i = 0; i < box_width; i++)); do
		printf "#"
	done
	printf "\n# %s #\n" "$string"
	for ((i = 0; i < box_width; i++)); do
		printf "#"
	done
	printf "\n"
}

function is_package_installed() {
	if pacman -Qs "^${1}$" &>/dev/null; then
		return 0
	fi

	return 1
}

relevant_packages+=(base)
relevant_packages+=(bind)
relevant_packages+=(efibootmgr)
relevant_packages+=(grub)
relevant_packages+=(iwd)
relevant_packages+=(linux)
relevant_packages+=(linux-firmware)
relevant_packages+=(vim)
password_status=$(passwd -S root | awk '{print $2}')
dev_mounts=$(mount | grep "^/dev")
warning_count=0

print_boxed_string "Passwords"

if [[ "$password_status" == "P" ]]; then
	printf "Password for root is set.\n\n"
else
	printf "WARNING: User root does not have a password set.\n\n"
	((warning_count++))
fi

print_boxed_string "Packages"

for package in "${relevant_packages[@]}"; do
	if ! is_package_installed "$package"; then
		printf "WARNING: %s is NOT installed.\n" "$package"
		((warning_count++))
	else
		printf "Package %s is installed.\n" "$package"
	fi
done

printf "\n"

print_boxed_string "Device Mounts"
printf "%s\n" "$dev_mounts"

if ! mount | grep "^/dev" &>/dev/null; then
	printf "WARNING: There are no devices mounted.\n"
	((warning_count++))
fi

printf "\nTotal warnings: %d\n" "$warning_count"

if [[ "$warning_count" -eq 0 ]]; then
	printf "You may reboot the system now! Good luck!\n"
fi

exit 0
