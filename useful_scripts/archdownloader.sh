#!/bin/bash

wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso -O ~/Downloads/archlinux-x86_64.iso
wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso.sig -O ~/Downloads/archlinux-x86_64.iso.sig
gpg --keyserver-options auto-key-retrieve --verify ~/Downloads/archlinux-x86_64.iso.sig

# add this line to get the name of the iso and make sure it is the right file type
# this is how the output should look like:
# ISO 9660 CD-ROM filesystem data (DOS/MBR boot sector) 'ARCH_202301' (bootable)
file ~/Downloads/archlinux-x86_64.iso

exit 0
