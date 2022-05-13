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
