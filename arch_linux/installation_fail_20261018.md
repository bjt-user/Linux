## 2026-10-18 - FAIL

TLDR - login incorrect? Set root password again before `reboot`?

First go into EFI shell and remove old boot options.

And now we will try to do the installation over ssh so we can work with \
a big screen and a nice terminal emulator.

#### (optional) increase font size

```
setfont -d
```

#### setup wifi

```
iwctl station list
```

```
iwctl station wlan0 scan
```

```
iwctl station wlan0 get-networks
```

```
iwctl --passphrase 123... station wlan0 connect my-ssid
```

```
curl -I https://example.com
```

#### setup openssh server

`sshd` service should already be active.

Either do `passwd` to set a root password or create an `authorized_keys` file.

```
vim /etc/ssh/sshd_config
```
=> `PermitRootLogin yes`

```
systemctl restart sshd
```

```
ip -4 a
```

And then you can connect from your desktop to the machine.

There might also be a DNS entry `archiso` which points to the installation \
machine.

So
```
ssh root@archiso
```
worked as well.

#### formatting disks

```
fdisk /dev/nvme0n1
```

```
g
n
\n
\n
+550M
n
\n
\n
\n
t
1
1
w
```
This is hard to script because sometimes you have to overwrite a signature \
by pressing `y` and sometimes not.

#### make file systems

```
# mkfs.fat -F32 /dev/nvme0n1p1
```

```
# mkfs.ext4 /dev/nvme0n1p2
```

#### mount the file systems (1.11 in arch install guide)

```
mount /dev/nvme0n1p2 /mnt
```

```
mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

```
root@archiso ~ # mount | grep "^/dev"
/dev/loop0 on /run/archiso/airootfs type squashfs (ro,relatime,errors=continue,threads=single,x-initrd.mount)
/dev/nvme0n1p2 on /mnt type ext4 (rw,relatime)
/dev/nvme0n1p1 on /mnt/boot type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro)
```

#### install essential packages (2.2)

```
pacstrap /mnt base linux linux-firmware vim iwd
```

We install the bootloader and `efibootmgr` later because the install guide \
does not say so yet.

They use `-K` to create an empty keyring but lets not do that.

#### generate file system table

```
genfstab -U /mnt >> /mnt/etc/fstab
```

Check it before going on:
```
less /mnt/etc/fstab
```

#### chroot

```
arch-chroot -S /mnt
```

#### skip time and localization

The "time" and "localization" stuff can be done later I guess.

#### set the hostname

```
echo "my_hostname" > /etc/hostname
```

#### root password

We already set it earlier.

#### boot loader

```
pacman -S grub efibootmgr
```

Let's check the mount point of the boot partition:
```
# mount | grep "/dev/nvme0n1p1"
/dev/nvme0n1p1 on /boot type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro)
```

Let's use `/boot` as the efi directory.

```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub_2026-10-18 --recheck
Installing for x86_64-efi platform.
Installation finished. No error reported.
```

```
grub-mkconfig -o /boot/grub/grub.cfg
```

#### exit chroot and reboot

I confirmed with `pacman -Ss` that `iwd` and `efibootmgr` are installed.

Remove the USB stick!

```
exit
```

TODO: Set root password again!!!\
Maybe read `/etc/shadow` and check if root has a password.

```
reboot
```

It boots into Arch, but I cannot login with root.\
It says "Login incorrect".

Maybe I have to set the password later?\
Before rebooting?
