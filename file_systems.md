To identify existing file systems, you can use lsblk:
```
lsblk -f
```
And this is the output on my Debian machine:
```
NAME FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT
sda                                                                         
├─sda1
│    vfat   FAT32       B402-F595                             482.8M     6% /boot/efi
├─sda2
│    ext4   1.0         353665b5-d110-4c93-ad25-7bf65659f2ec  189.4G    13% /
└─sda3
     swap   1           00f9fc39-e943-42a9-b8b4-705414c1fbd0                [SWAP]
sr0                                                                         
```
So the boot partition is 482MB and is a FAT32 file system.\
Then there is the main partition with 189GB and a ext4 file system.\
And at last there is the swap partition which seems to have the remaining space but seems to be unused at the moment.
