Bought a new SSD.
=> it is not recognized in file browser by Ubuntu and Debian.
(Ubuntu makes a mount sound though)

With `lsblk` you can see all hard drives.

```
sudo apt install gparted
```
(it is a GUI program)
=> it recognizes the SSD
==> device -> create new partition table -> gpt
==> create a new partition in the unallocated space (file system: ext4)
===> Apply all operations

Now the SSD is recognized by the file browser.

But I still can't copy paste files into the SSD because of permission problems.
```
sudo dd if=/dev/sda of=/dev/sdb
```
=> started at 19:42
=> finished at ?
"dd: writing to '/dev/sdb': No space left on device
250069679+0 records in
250069678+0 records out
128035675136 bytes (128GB, 119GiB) copied, 28423,8 s, 4,5MB/s"

=> SSD is not visible in file browser anymore.
Maybe the problem is that I created a partition.

GParted says there is a problem with partitions or something.
So I fill the SSD with all zeros and then try again with the dd command.
```
sudo dd if=/dev/zero of=/dev/sdb bs=1M
```
=>
dd: error writing '/dev/sdb': No space left on device
122105+0 records in
122104+0 records out
128035675136 bytes (128GB, 119GiB) copied, 10074,8s, 12,7 MB/s

Trying again with dd:
```
sudo dd if=/dev/sda of=/dev/sdb
```
=> not recognized by file browser

It did probably not work because the drives don't have the same memory size, so you can't copy data bit by bit.

While partitioning etc., the drive has to unmounted, otherwise the functions will be grey in Gparted!

To copy the internal drive I can't unmount it because I am using it.
=> So I probably have to use a Linux Live System on a USB stick.
==> Downloaded Gparted Live.

All attempts failed.
***
#CONCLUSION:                                                                                                                                           
#- either install a fresh operating system (recommended)                                                                                               # 
#- or use two usb to sata cables, connect both drives to a third computer and use GParted on that                                                      #
***

#### external hard drive as backup

```
watch lsblk
```
Then connect the UBS-to-SATA-cable with the hdd and computer.\
(and wait for like 5 seconds)

You can access the data of that external drive in that folder:
```
/media/bf/[longlistofnumber]/home/bf...
```

Backup your data like this:
```
#!/bin/env bash

rsync -aAxv --delete /home/bf/Documents /media/bf/*/home/bf/
```

Unmounting the hdd before unplugging (just to be safe):
```
sudo umount /media/bf/*
```
If `target is busy` error occurs close terminal and open a new one.
