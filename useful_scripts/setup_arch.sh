#!/bin/bash

function confirmation() {
  read -p "Do you really want to continue? [y|n] "
  if [ "$REPLY" != "${REPLY#[Yy]}" ] ;then
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
    confirmation
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
desired_packages+=(fzf)
desired_packages+=(task)

for desired_package in "${desired_packages[@]}"
do
  ensure_package "$desired_package"
done

exit 0
