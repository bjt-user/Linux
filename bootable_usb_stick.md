Make bootable USB stick: (fast and easy with "dd" command)
```
sudo fdisk -l
```
This should show your USB stick in the last output line like this:
```
/dev/sdb1  *     2048 120979455 120977408 57.7G  c W95 FAT32 (LBA)
```

or
```
lsblk
```

Now 'cd' into the folder your .iso file is in.
```
cd ~/Downloads

sudo dd if=./manjaro-xfce-21.1.4-210927-linux513.iso of=/dev/sdb
```
if stands for input file, of stands for output file

Notice, that you don't type the 1 after sdb. That is the partitioning that happens automatically.

The `.` before `/manjaro...` means that the file is in the folder you are currently in.

use `status=progress` so you can see what it is doing and how long it might take
```
sudo dd if=./manjaro-gnome-21.3.7-minimal-220816-linux515.iso of=/dev/sdb status=progress
```

Now you can unmount your USB stick and take it out.

=> FAIL: was not able to boot the image. Windows kept coming up.
But the same result with "Balena Etcher".
=> Then I used the BIOS tool `HP Disk Sanitizer` which deletes the disk drive and makes it not readable anymore.
This took 22 hours.
=> After that the laptop actually booted into Manjaro.

-------------------------------------------------------------------------------------------------------------------------
