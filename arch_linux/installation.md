https://archlinux.org/download/

Took the mirror from "Uni Bayreuth".\
And then the first link:\
archlinux-2022.05.01-x86_64.iso

this is a symlink to the latest version: \
http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso

so you can do:
```
wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso
```

```
wget http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/archlinux-x86_64.iso.sig
```

http://ftp.tu-chemnitz.de/pub/linux/archlinux/iso/latest/ has also a tarred iso if you have bad internet connection

#### verify download

download a .sig file from the downloads page from the link `ISO PGP signature` \
https://archlinux.org/download/#checksums

then put the .sig file in the same folder with your download and run:
```
gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```
(the `.sig` file needs to have the same file name as the `.iso` file but then end with `.sig`) \
=> it says `good signature` but also a warning that it is not a trusted signature, whatever, it seeems to be ok

---
#### burn iso to usb stick

Then the plan is to use `dd` to flash the USB-stick.

```
watch lsblk
```
Then plugin USB stick to find out its device name.\
It is called "sdb" (sdb1-3).

```
sudo dd if=~/Downloads/archlinux-2022.05.01-x86_64.iso of=/dev/sdb status=progress
```

After 2 minutes:
```
1692312+0 records in
1692312+0 records out
866463744 bytes (866 MB, 826 MiB) copied, 98.7825 s, 8.8 MB/s
```

The device is still called "Ubuntu" for some reason...:
```
sdb      8:16   1  57.7G  0 disk 
├─sdb1   8:17   1   2.9G  0 part /media/bf/Ubuntu 20.04.3 LTS amd64
├─sdb2   8:18   1   3.9M  0 part /media/bf/54C5-9C6C
└─sdb3   8:19   1  54.8G  0 part /media/bf/writable
```
But after unplugging, typing `watch lsblk` again:
```
sdb      8:16   1  57.7G  0 disk
├─sdb1   8:17   1   748M  0 part /media/bf/ARCH_202205
└─sdb2   8:18   1    78M  0 part
```
It looks better.

Mounting the device first and unmounting it later might ensure data integrity.\
[mount.md](mount.md)

---

#### installation

After booting into the flashed USB I get the option to choose between different installation types.\
I chose the first option "Arch Installation..."\
some commands are being ran.\
Then I am in a command prompt called `root@archiso`.

**Important**: Before starting the installation figure out what mode your firmware is in.\
UEFI or legacy BIOS?\
BIOS mode might also be called CSM (compatibility support module)

https://wiki.archlinux.org/title/Installation_guide#Verify_the_boot_mode

#### keyboard layout
First step will be to get rid of US keyboard layout.\
`-` is at `ß`.\
`y` is at `z`

```
loadkeys de-latin1
```

#### installing wifi

with
```
ip link
```
it seems you can list network devices.

I get
```
...
4: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DORMANT group default qlen 1000 link/ether 00:1b:77:... brd ff:ff:ff:ff:ff:ff
```

Enter
```
iwctl
```
to get into an interactive prompt.
```
[iwd]# device list
```
To list your wifi devices.\
Output:
```
name    Address     Powered     Adapter     Mode
wlan0   00:1b:77:...    on      phy0        station
```
Then, to initiate a scan for networks (**note that this command will not output anything**):
```
[iwd]# station wlan0 scan
```

You can then list all available networks:
```
[iwd]# station wlan0 get-networks
```

Finally, to connect to a network:
```
[iwd]# station wlan0 connect [SSID]
```
(SSID is your network name)\
output:
```
Type the network passphrase for ... psk.
Passphrase:
```
(`Passphrase` just means wifi password)

If a passphrase is required, you will be prompted to enter it. Alternatively, you can supply it as a command line argument:
```
$ iwctl --passphrase [passphrase] station [device] connect [SSID]
```

Now exit `iwctl` with `CTRL + D`.

```
ping -c 3 google.com
```
And I can connect to the internet!

```
timedatectl
```
is 5 minutes behind and says `NTP service: inactive`
```
timedatectl set-ntp true
```
How to get into the right time zone?
```
timedatectl list-timezones
```
I get into a `less`ed output and scroll down with `j`.\
`Europe/Berlin` looks good.
```
timedatectl set-timezone Europe/Berlin
```
---
#### partitioning the disk

When recognized by the live system, disks are assigned to a block device such as /dev/sda, /dev/nvme0n1 or /dev/mmcblk0. To identify these devices, use `lsblk` or `fdisk`.
```
fdisk -l
```
Results ending in rom, loop or airoot may be ignored.

I have `sda` with 300G and `sdb` with 57G but 748M seem to be written.\
`sdb` should be the UBS-stick with the arch iso.\
`sda` is the hard drive.

The following partitions are required for a chosen device:

- One partition for the root directory `/`.
- For booting in UEFI mode: an EFI system partition.

Use fdisk or parted to modify partition tables. For example:
```
fdisk /dev/the_disk_to_be_partitioned
```

So I do
```
fdisk /dev/sda
```
because I want to partition the hard drive and not the USB stick.

Now I am in a new command prompt. (you can press `m` for help)

Now it is time to choose a partition table.

`MBR` partition table (also known as `DOS` or `MS-DOS` partition table)

Type
```
g
```
for "create a new empty GPT partition table\
Output: `created a new GPT disklabel (GUID: 0C88...)`

Type
```
n
```
to "add a new partition"\
create partion 1 so enter
```
1
```

First sector: Just hit enter (and accept the default of 2048)\
(whatever that means)

Last sector: Enter `+550M`\
(this is for the EFI partition)

It tells me
```
Partition #1 contains a ext4 signature.
Do you want to remove the signature? Y/N
```
I type `Y`

Now the second partition:
```
n
```
to create a new partition\
partition number
```
2
```
First sector: Just hit enter (leave it as default, it will be at the end of the last sector)\
Last sector: Just hit enter to give it the remaining space

Now do `t` to "change a partition type"\
`1` to change the type of the first partition\
type `L` to list everything\
`q` to quit out of the `less`ed list\
`1` for `EFI System`

```
w
```
to write and partition the disks and go out of the command prompt

And when I now type `lsblk` it looks good.\
`sda1` is 550M and `sda2` is 297.6G

#### mkfs (make filesystem)

Now make the boot partition a FAT32 filesystem:
```
mkfs.fat -F32 /dev/sda1
```

Make the second partition
```
mkfs.ext4 /dev/sda2
```
Then it said
```
/dev/sda2 contains unknown readable demand paged pure executable data
proceed anyway?
```
I hit `y` and then another prompt came with
```
Creating journal...
```
I didn't do anything for 1-2 minutes and then it seemed to have accepted a default answer.

#### mount the big partition

```
mount /dev/sda2 /mnt
```
#### base installation (2.2)
```
pacstrap /mnt base linux linux-firmware vim
```
This seems to install the `Arch Linux` base package.\
Takes a couple of minutes.

https://wiki.archlinux.org/title/Installation_guide#Install_essential_packages

#### generate file system table
```
genfstab -U /mnt >> /mnt/etc/fstab
```
(no output)

```
arch-chroot /mnt
```
And the prompt changes slightly

#### configure locale 2

Set time zone
```
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```
To know how to enter the time zone you can do
```
ls /usr/share/zoneinfo/
```
for the time zone and
```
ls /usr/share/zoneinfo/Europe
```
to know the city

#### set hardware clock
```
hwclock --systohc
```
#### configure locale 3
```
pacman -S vim
```
to be able to edit config files.

omit these optional steps: (it configures the language of your system)
```
vim /etc/locale.gen
```
I uncommented this line:
```
de_DE.UTF-8 UTF-8
```
Now run
```
locale-gen
```
(end of optional steps)

If you set the console keyboard layout, make the changes persistent in vconsole.conf(5):
```
/etc/vconsole.conf
```
and insert the line
```
KEYMAP=de-latin1
```
#### create the hostname
Create a file called `hostname` in `/etc`
```
vim /etc/hostname
```
And just pick a name.\
I entered "arch-cli-machine".

#### create the hosts file
```
vim /etc/hosts
```

and put in these lines:
```
127.0.0.1        localhost
::1              localhost
127.0.1.1        [myhostname]
```
where myhostname is "arch-cli-machine".

#### set root password
```
passwd
```

#### create a user
``` 
useradd -m bf -s /bin/bash
```
`-s` is the standard shell for the user

now set the password for the new user:
```
passwd bf
```

#### install and configure sudo
```
pacman -S sudo
```
```
EDITOR=vim visudo
```
and above the line that starts with root I enter
```
bf ALL=(ALL:ALL) ALL
```
(or duplicate the root line and change root to bf)

#### install grub
```
pacman -S grub
```

#### install stuff (because youtube tutorial says so)

```
pacman -S efibootmgr dosfstools os-prober mtools
```

#### create EFI dir

```
mkdir /boot/EFI
```
```
mount /dev/sda1 /boot/EFI
```

#### installing grub

When using `efi` you need to install the packages `efibootmgr` and `grub`.

Depending on where you mounted your efi/boot partition you need to specify the `--efi-directory`.\
Check with `mount` where you mounted it.\
In this example I had mounted `/dev/sda1` on `/boot`:
```
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=boot --recheck
```
Then create the config:
```
grub-mkconfig -o /boot/grub/grub.cfg
```

A failed attempt:
```
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
```
ERROR:
```
EFI variables are not supported on this system.
```
(solution here might be to use `--removable` as an additional flag)

trying to resolve this error by exiting out of `chroot`
```
exit
modprobe efivarfs
```
Now `chroot` back in.
```
arch-chroot /mnt
```
```
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
```
Still the same error...

Trying to proceed anyway...

Maybe this laptop does not support `UEFI`?!

```
grub-mkconfig -o /boot/grub/grub.cfg
```

```
pacman -S networkmanager
```
```
systemctl enable NetworkManager
```
#### reboot
Exit out of the `chroot`
```
exit
umount -l /mnt
shutdown -r now
```
But before that disconnect the USB stick.

## FAIL

But it doesnt boot into the OS, probably because the laptop does not support `UEFI`.

## analysis

There are two main types of partition table available.\
These are the #Master Boot Record (MBR) and #GUID Partition Table (GPT).

"If you are installing on older hardware, especially on old laptops, consider choosing `MBR` because its BIOS might not support `GPT`"\
https://wiki.archlinux.org/title/Partitioning

"A third, less common alternative is using a partitionless disk, which is also discussed."

Also for the boot partition I should **not** use `EFI`. I should use `FAT32` but still mount to `/boot/efi`.

## successful second try (correct partitioning)

I booted from USB again, had to do everything again until the partitioning section.\
But the partitions seem to be already created.

```
fdisk /dev/sda
```

When I am in `fdisk` cli and type `i` and then `1` or `2` I can see the partitions.\
I could try to delete them or just create a new label.\
Trying to create an `MBR` (`DOS`) partition table:
```
o
```
Then the `i` command outputs: `No partition is defined yet`. So I guess it was wiped.

It looks like you don't need a boot partition for MBR so I will just do one partition with the file system `83: Linux`.

```
n
```
to add a new partition

```
p
```
(primary partition)
```
1
```
(partition number 1)

Then I hit enter to accept the default of 2048 for the `first sector`.\
`Last sector ...:` I hit enter to go with the default of writing until the end.

Now hit `i` to look at the partition.\
And the partition is automatically `83 Linux`, so I dont need to change the partition type. (you could do that with `t`)

Hit `p` to print the partition table.\
And it shows again the disklabel type `dos` and the one partition with `83 - Linux`.

```
w
```
to write and partition the disks and go out of the command prompt

Checked `lsblk` and it looks ok.

Now make the filesystem:
```
mkfs.ext4 /dev/sda1
```
Mount the only partition:
```
mount /dev/sda1 /mnt
```
install the base system
```
pacstrap /mnt base linux linux-firmware
```

```
genfstab -U /mnt >> /mnt/etc/fstab
```
to verify type `cat /mnt/etc/fstab`\
Then leave the installer:
```
arch-chroot /mnt
```

```
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```

```
hwclock --systohc
```

```
pacman -S vim
```

If you set the console keyboard layout, make the changes persistent in vconsole.conf(5):
```
/etc/vconsole.conf
```
and insert the line
```
KEYMAP=de-latin1
```

```
vim /etc/hostname
```
And just pick a name.
```
vim /etc/hosts
```
and put in these lines:
```
127.0.0.1        localhost
::1              localhost
127.0.1.1        [myhostname]
```

```
passwd
```
to set a pw for root (**mandatory - otherwise you cant login anymore**)

---
creating a user is **optional**:
``` 
useradd -m bf -s /bin/bash
```

```
passwd bf
```

```
pacman -S sudo
```
```
EDITOR=vim visudo
```
and above the line that starts with root I enter
```
bf ALL=(ALL:ALL) ALL
```
---

```
pacman -S grub networkmanager network-manager-applet dialog dosfstools os-prober mtools linux-headers base-devel wpa_supplicant wireless_tools iwd man
```
Hit enter twice to confirm the default and proceed with installation.

With `mbr` you don't have a boot partition so from here it will be different to the first try!

```
grub-install --target=i386-pc /dev/sda
```
Then it should respond with
```
Installing for i386-pc platform.
Installation finished. No error reported.
```
```
grub-mkconfig -o /boot/grub/grub.cfg
```
```
exit
```
```
umount -a
```
you get `target is busy` errors but tutorial says that is fine
```
reboot
```
**unplug usb-stick**

Choose the first option `Arch-Linux`.\
And login with your root user.

```
systemctl enable --now NetworkManager
```

Because I use wifi I do this:
```
nmtui
```
=> activate a connection (it is in german now...)\
Then select your router hit enter and enter the password.

=> this does not always work so you might need to do this:
```
nmcli d wifi connect [SSID] --ask
```

Or maybe install `iwd` before then you can do it like described in the beginning.

=> everything seems to work fine now (scp works, pacman works, git clone works)

=> I had a working Arch Linux machine

**This will only work if CSM is enabled in UEFI!**

---
#### qemu installation

create disk:
```
qemu-img create -f qcow2 myimage.img 10G
```
create vm
```
qemu-system-x86_64 --enable-kvm -cdrom ~/Downloads/archlinux-x86_64.iso -hda myimage.img -m 2G
```

```
loadkeys de
```
```
fdisk /dev/sda
```
```
o
```
```
n
```
<kbd>enter</kbd>, <kbd>enter</kbd>, <kbd>enter</kbd>, <kbd>enter</kbd>
```
w
```
```
mkfs.ext4 /dev/sda1
```
```
mount /dev/sda1 /mnt
```
```
pacstrap /mnt base linux linux-firmware
```
```
genfstab -U /mnt >> /mnt/etc/fstab
```
```
arch-chroot /mnt
```
```
hwclock --systohc
```
```
pacman -S vim
```
```
vim /etc/vconsole.conf
```
put `KEYMAP=de` in it.
```
vim /etc/hostname
```
choose a hostname
```
vim /etc/hosts
```
put this in it
```
127.0.0.1        localhost
::1              localhost
127.0.1.1        [myhostname]
```
```
passwd
```
choose a root password
```
pacman -S grub networkmanager dosfstools mtools linux-headers base-devel
```
```
grub-install --target=i386-pc /dev/sda
```
```
grub-mkconfig -o /boot/grub/grub.cfg
```
```
exit
```
```
umount -a
```
```
shutdown now
```

start the VM without the iso image:
```
qemu-system-x86_64 --enable-kvm -hda myimage.img -m 2G
```
start `tigervnc` on port 5900

```
systemctl enable --now NetworkManager
```
(case sensitive)\
=> now `curl -I https://google.com` works!

I have a working Arch VM.\
But can I ssh into it, after installing `openssh`, enabling `sshd` and changing `/etc/ssh/sshd_config`\
=> No.

I got it working with port forwarding (using a tap device would be better, but that is way more complicated)

```
qemu-system-x86_64 -enable-kvm -hda myimage.img -m 2G -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22
```
Then you can connect with (on the local machine)
```
ssh root@localhost -p 5555
```

or on a remote machine with
```
ssh root@ipofvmhost -p 5555
```
Then you can configure your VM in `.ssh/config`\
and set the port in the ssh config so you dont have to remember the port!

---
#### if you want to configure the locale

```
vim /etc/locale.gen
```
uncommented `de_DE.UTF-8 UTF-8`
```
locale-gen
```

```
vim /etc/locale.conf
```
put in `LANG=de_DE.UTF-8` and save the file

But I need to change the language back to english but keep german keyboard layout.

So I change the locale back to english
```
vim /etc/locale.gen
```
I commented this line back:
```
de_DE.UTF-8 UTF-8
```
and uncomment this:
```
en_US.UTF-8 UTF-8
```
```
locale-gen
```
The command `locale` still shows an error.
Then I did `sudo reboot` and it seemed to have worked.

---

#### useful pacman packages

to get for example `nslookup` and `dig` command:
```
pacman -S bind
```

#### TODO: archinstaller

https://github.com/archlinux/archinstall

In the normal iso image there should also be an installer included.\
It should be started by typing `archinstall` when you are in the `root@archiso` prompt.\
First you select the normal first option `install arch linux...`, the you get into the promp `root@archiso`.\
Then type `archinstall`.\
But make sure you have an internet connection before you start it.

```
loadkeys de-latin1
```
```
curl -I https://www.google.com
```
```
archinstall
```

=> failed to install packages to new root

By default, the archinstall script uses the `cfdisk` utility to partition disks during the installation process.\
However, it is possible to specify a different partitioning tool to use by passing the -p option to the archinstall command and specifying the desired partitioning tool.

For example, to use fdisk as the partitioning tool during the Arch Linux installation process, you can run the following command:
```
archinstall -p fdisk
```
Alternatively, you can use the parted tool by specifying parted as the partitioning tool:
```
archinstall -p parted
```

#### FAIL: EFI partitioning

followed this trash video:\
https://www.youtube.com/watch?v=CX67oR5GjRc

I created the partitions with `sfdisk`.\
They looked like this:
```
# fdisk -l /dev/vda
Disk /dev/vda: 20 GiB, 21474836480 bytes, 41943040 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: F724A307-757C-4188-9778-B0D7D733D081

Device      Start      End  Sectors  Size Type
/dev/vda1    2048   411647   409600  200M EFI System
/dev/vda2  411648 41940991 41529344 19.8G Linux filesystem
```

```
mkfs.fat -F32 /dev/vda1
```
```
mkfs.ext4 /dev/vda2
```

```
mount /dev/vda2 /mnt
```
```
mkdir /mnt/boot
```
```
mount /dev/vda1 /mnt/boot
```
Make sure that both partitions are mounted like this with `lsblk`:
```
# lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0 748.3M  1 loop /run/archiso/airootfs
sr0     11:0    1 872.3M  0 rom  /run/archiso/bootmnt
vda    254:0    0    20G  0 disk
├─vda1 254:1    0   200M  0 part /mnt/boot
└─vda2 254:2    0  19.8G  0 part /mnt
```

```
pacstrap /mnt base linux linux-firmware vim
```

```
genfstab -U /mnt >> /mnt/etc/fstab
```

But the boot partition does NOT show up in /mnt/etc/fstab:
```
# cat /mnt/etc/fstab
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/vda2
UUID=3c95c366-4aea-4fdd-97e1-b677c9344d98	/         	ext4      	rw,relatime	0 1
```

```
arch-chroot /mnt
```

And of course it fails at this step:
```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
Installing for x86_64-efi platform.
grub-install: error: /boot doesn't look like an EFI partition.
```
mit `blkid` mache ich manuell den `/etc/fstab` Eintrag:
```
UUID=D2FD-EC33	/boot	vfat	rw,relatime	0 1
```

Nur dann kommt wieder der Dreck mit den EFIVariablen:
```
EFI variables are not supported on this system.
```

The problem was that the VM was in 'BIOS' mode.\
Open `virt-manager` open the VM and go in the `details` section. (`view` -> `details`) \
In the first section `overview` under `hypervisor details` you can see:
```
Firmware: BIOS
```

=> And that means you can only use MBR!

---
## troubleshooting

#### keyboard layout doesn't persist

`/etc/vconsole.conf` does not persist the keyboard layout

Maybe I can set a kernel parameter for the keyboard layout:
>Note that the kernel command line options vconsole.keymap=, vconsole.keymap_toggle=, vconsole.font=, vconsole.font_map=, vconsole.font_unimap= may be used to override the console settings at boot.

setting vconsole.keymap=de-latin1 did not work\
maybe the keymap_toggle needs to be set too

If all fails you can put `loadkeys de-latin1` into ~/.bashrc

You have to recreate the initrd:
```
sudo mkinitcpio -p linux
```
=> issue solved

#### ssh into arch

```
pacman -S openssh
systemctl enable --now sshd
```

The you need the perfect `/etc/ssh/sshd_config` to get in...\
You need this line (remove `#` in front and a add `yes` at the end):
```
PermitRootLogin yes
```

#### computer does not boot into operating system

If your computer does not boot into the OS and only boots into UEFI, \
then it might be possible that **CSM** (compatibility support module)[https://en.wikipedia.org/wiki/UEFI#CSMBOOT] \
is not enabled in your UEFI.

Or you have to use an EFI partition, but that is more complicated to setup.

---
