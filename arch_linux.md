https://archlinux.org/download/

Took the mirror from "Uni Bayreuth".\
And then the first link:\
archlinux-2022.05.01-x86_64.iso

Then the plan is to use `dd` to flash the USB-stick.

```
watch lsblk
```
Then plugin USB stick to find out its device name.\
It is called "sdb" (sdb1-3).

```
sudo dd if=~/Downloads/archlinux-2022.05.01-x86_64.iso of=/dev/sdb
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

#### installation

After booting into the flashed USB I get the option to choose between different installation types.\
I chose the first option "Arch Installation..."\
some commands are being ran.\
Then I am in a command prompt called `root@archiso`.

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
***
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
#### base installation
```
pacstrap /mnt base linux linux-firmware
```
This seems to install the `Arch Linux` base package.\
Takes a couple of minutes.

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
passw
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

```
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
```
ERROR:
```
EFI variables are not supported on this system.
```

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

#### second try

I booted from USB again, had to do everything again until the partitioning section.\
But the partitions seem to be already created.

When I am in `fdisk -l` command prompt and type `i` and then `1` or `2` I can see the partitions.\
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
to set a pw for root

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

```
pacman -S grub networkmanager network-manager-applet dialog dosfstools os-prober mtools linux-headers base-devel wpa_supplicant wireless_tools
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
systemctl start NetworkManager
```

Because I use wifi I do this:
```
nmtui
```
=> activate a connection (it is in german now...)\
Then select your router hit enter and enter the password.

Make `NetworkManager` start automatically at boot time:
```
systemctl enable NetworkManager
```
=> everything seems to work fine now (scp works, pacman works, git clone works)

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

=> I have a working Arch Linux machine
