`man dd` says "dd - convert and copy a file"

find your device or drive with
```
watch -d lsblk
```
then stick in the drive

#### flashing an iso-image on a usb-stick
```
sudo dd if=~/Downloads/archlinux-2022.05.01-x86_64.iso of=/dev/sdb
```

=> this usually worked, but one time I got an error and I got 0-16 "loop" devices in `lsblk`...
```
loop0    7:0    0 938,5M  1 loop /snap/android-studio/119
loop1    7:1    0     4K  1 loop /snap/bare/5
loop2    7:2    0  55,5M  1 loop /snap/core18/2344
loop3    7:3    0 998,6M  1 loop /snap/android-studio/121
loop4    7:4    0  61,9M  1 loop /snap/core20/1494
loop5    7:5    0  61,9M  1 loop /snap/core20/1518
loop6    7:6    0   219M  1 loop /snap/gnome-3-34-1804/72
loop7    7:7    0   219M  1 loop /snap/gnome-3-34-1804/77
loop8    7:8    0  55,5M  1 loop /snap/core18/2409
loop9    7:9    0 248,8M  1 loop /snap/gnome-3-38-2004/99
loop10   7:10   0  54,2M  1 loop /snap/snap-store/558
loop11   7:11   0  65,2M  1 loop /snap/gtk-common-themes/1519
loop12   7:12   0  81,3M  1 loop /snap/gtk-common-themes/1534
loop13   7:13   0    51M  1 loop /snap/snap-store/547
loop14   7:14   0  44,7M  1 loop /snap/snapd/15904
loop15   7:15   0 254,1M  1 loop /snap/gnome-3-38-2004/106
loop16   7:16   0    47M  1 loop /snap/snapd/16010
```

How do I remove those drives?

I could remove some with this command:
```
sudo apt purge snapd
```

then I deleted all loop devices in `/dev`. But they were still there.\
But after a `reboot` they were gone.

But then I didnt have audio anymore.

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
(or try `bs=4096` but that is probably slower that would be 4KB)\
(or `bs=10M`)\
(default `bs` is 512)

write speed seems to get slower and slower...

output:
```
31708938240 bytes (32 GB, 30 GiB) copied, 3181.97 s, 10.0 MB/s
```

#### status=progress

Option `status=progress` is a nice more verbose option to get some information printed to stdout while writing to disk.

#### using time

```
time sudo dd if=~/Downloads/archlinux-x86_64.iso of=/dev/sdb status=progress
```

```
839909888 bytes (840 MB, 801 MiB) copied, 133 s, 6.3 MB/s
1659544+0 records in
1659544+0 records out
849686528 bytes (850 MB, 810 MiB) copied, 144.571 s, 5.9 MB/s

real	2m24.624s
user	0m2.323s
sys	0m7.504s
```

#### eject

Not sure what this does...

```
sudo eject /dev/sdb
```

***
