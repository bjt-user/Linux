#!/bin/bash

function confirmation() {
  read -p "Do you really want to continue? [y|n] "
  if [ "$REPLY" != "${REPLY#[Yy]}" ]; then
    echo "Proceeding..."
  else
    echo "Aborting script..."
    exit 1
  fi
}

function ensure_package() {
  local package
  package=$1

  if ! type ${package} &>> /dev/null; then
    printf "You do NOT have %s installed.\n" "$package"
    echo "It will be installed."
    if sudo pacman -S ${package} --noconfirm; then
      printf "%s was installed.\n" "$package"
    else
      printf "Installation of %s FAILED!!!" "$package"
      exit 1
    fi
  else
    printf "%s is already installed.\n" "$package"
  fi
}

declare -a desired_packages
desired_packages+=(qemu-system-x86)
desired_packages+=(virt-manager)
desired_packages+=(qemu-img)

echo "This will install qemu and perform a REBOOT!"

confirmation

for desired_package in "${desired_packages[@]}"
do
  ensure_package "$desired_package"
done

if sudo systemctl enable --now libvirtd; then
  echo "Enabled libvirtd."
else
  echo "Failed to enable libvirtd."
fi

sudo usermod -aG libvirt ${USER}

sudo reboot

exit 0
