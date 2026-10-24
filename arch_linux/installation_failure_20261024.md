#### cleanup boot entries

Go into EFI shell.

Show boot entries:
```
bcfg dump -v -b
```

Remove old grub entries.
```
bcfg boot rm 0
```

=> start Arch installation

#### iwd + ssh access

Setting up iwd and ssh access is straight foreward and does not need to be \
documented here.

#### fdisk

```
fdisk /dev/nvme0n1
```

```
Device         Start       End   Sectors   Size Type
/dev/nvme0n1p1  2048      2560       513 256.5K EFI System
/dev/nvme0n1p2  4096 500117503 500113408 238.5G Linux filesystem

Filesystem/RAID signature on partition 1 will be wiped.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

#### mkfs

```
root@archiso ~ # mkfs.fat -F32 /dev/nvme0n1p1
mkfs.fat 4.2 (2021-01-31)
WARNING: Number of clusters for 32 bit FAT is less then suggested minimum.
```

I forgot the `M` at the `fdisk` operation.

Now it should work:
```
Device           Start       End   Sectors  Size Type
/dev/nvme0n1p1    2048   1050623   1048576  512M EFI System
/dev/nvme0n1p2 1050624 500117503 499066880  238G Linux filesystem
```

```
mkfs.fat -F32 /dev/nvme0n1p1
```

```
mkfs.ext4 /dev/nvme0n1p2
```

#### mount the file systems

Mount the big partition first:
```
mount /dev/nvme0n1p2 /mnt
```

Now mount the boot partition:
```
# mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

```
# mount | grep "^/dev"
/dev/loop0 on /run/archiso/airootfs type squashfs (ro,relatime,errors=continue,threads=single,x-initrd.mount)
/dev/nvme0n1p2 on /mnt type ext4 (rw,relatime)
/dev/nvme0n1p1 on /mnt/boot type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro)
```

#### pacstrap

Before pacstrap, try to pick good mirrors.

```
vim /etc/pacman.d/mirrorlist
```
I copied a geographically close mirror to the top.

```
pacstrap /mnt base linux linux-firmware vim iwd grub efibootmgr
```

```
error: failed retrieving file 'linux-7.2.11.arch1-1-x86_64.pkg.tar.zst' from ftp.tu-chemnitz.de : Operation too slow. Less than 1 bytes/sec transferred the last 10 seconds
```

Okay, lets restore `/etc/pacman.d/mirrorlist`.

Now the `pacstrap` command was successful.

#### fstab

```
genfstab -U /mnt >> /mnt/etc/fstab
```

```
# cat /mnt/etc/fstab
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/nvme0n1p2
UUID=25c8f26e-3bc0-40fa-a330-3fdd2c01a1e3       /               ext4            rw,relatime     0 1

# /dev/nvme0n1p1
UUID=C684-6B33          /boot           vfat            rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro   0 2
```

This looks correct. The root partition probably needs to be first.\
So you definatelly only need to execute ONE `genfstab` command.

#### chroot

```
arch-chroot -S /mnt
```

#### set hostname

```
echo "arch-thinkpad" > /etc/hostname
```

#### setup bootloader

```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub_$(date +%Y%m%d) --recheck
Installing for x86_64-efi platform.
Installation finished. No error reported.
```

```
grub-mkconfig -o /boot/grub/grub.cfg
```

#### exit chroot

```
exit
```

The script does not have any warnings.

But now the `root` user has a password in `/etc/shadow`, but not in \
`/mnt/etc/shadow`.

This might be a problem.

Copy the check script into the chroot:
```
# cp -v arch_install_reboot_check.sh /mnt/tmp
'arch_install_reboot_check.sh' -> '/mnt/tmp/arch_install_reboot_check.sh'
```

Let's try to chroot back in:
```
arch-chroot -S /mnt
```

But the script is not there...

Put it in the `/mnt/root` dir:
```
# cp -v /tmp/arch_install_reboot_check.sh /mnt/root/.
'/tmp/arch_install_reboot_check.sh' -> '/mnt/root/./arch_install_reboot_check.sh'
```

Let's try to chroot back in:
```
arch-chroot -S /mnt
```

And now the script seems to work!\
The root password is not set and `bind` is not installed.

```
pacman -S bind
```

```
passwd
```

Now the script is fine.

I will copy the authorized keys file into the chroot as well:
```
# cp -v /root/.ssh/authorized_keys /mnt/root/.ssh/.
'/root/.ssh/authorized_keys' -> '/mnt/root/.ssh/./authorized_keys'
```

#### reboot

Remove USB stick.

```
reboot
```

#### Boot Manager recovered from an error.

> Boot Manager has restored Boot Priority from default configuration.

> Press ESC to continue or F1 to enter Setup.

I hit ESC.

#### FAIL

I keep booting into the Thinkpads "Boot Menu".

#### RESCUE?

Can it be rescued by using the arch-installation medium, mounting the \
file systems again and chrooting in?

I will try to do the `grub-install` again.\
Maybe the problem was that I remove boot options that Thinkpad treats \
as defaults.

And THAT WORKED!

NEVER REMOVE BOOT ENTRIES THAT THE FIRMWARE HAS SET BY DEFAULT!

#### network

I can't resolve hostnames and I do not have an IPv4 address.
