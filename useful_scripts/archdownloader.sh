#!/bin/bash

wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso -O ~/Downloads/archlinux-x86_64.iso
wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso.sig -O ~/Downloads/archlinux-x86_64.iso.sig
gpg --keyserver-options auto-key-retrieve --verify ~/Downloads/archlinux-x86_64.iso.sig

exit 0
