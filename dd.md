`man dd` says "dd - convert and copy a file"

find your device or drive with
```
watch lsblk
```
then stick in the drive

#### flashing an iso-image on a usb-stick
```
sudo dd if=~/Downloads/archlinux-2022.05.01-x86_64.iso of=/dev/sdb
```

#### fill drive with zeros
WARNING: use this with extreme caution:
```
sudo dd if=/dev/zero of=/dev/sdX
```


#### todo
try option `status=progress` to get some information printed to stdout while writing to disk
