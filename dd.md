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
(this takes very long, so you should use the `status` option)\
also you should use a block size

so I try this:
```
sudo dd if=/dev/zero of=/dev/sdb bs=1M status=progress
```
(maybe next time put `time()` around it)\
(or try `bs=4096` but that is probably slower that would be 4KB)\
(or `bs=10M`)\
(default `bs` is 512)

write speed seems to get slower and slower...


#### todo
try option `status=progress` to get some information printed to stdout while writing to disk
