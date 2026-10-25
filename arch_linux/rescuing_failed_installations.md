## general approach

You can always use an Arch Linux installation medium, mount the existing \
file systems to `/mnt` again and chroot in to maybe install `grub` again \
or change the `fstab`.

## install forgotten packages

Boot into Arch installation medium.\
Look up the name of the root partition with `fdisk -l` or `lsblk -f`.\
Mount the root partition to `/mnt`.\
Setup wifi with `iwctl`.

```
pacstrap /mnt forgotten_pkg
```
```
reboot
```
