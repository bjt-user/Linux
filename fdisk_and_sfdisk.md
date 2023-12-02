#### scripting fdisk

You can either use the tool `sfdisk` or pipe into `fdisk`.

This is for one partition MBR:
```
printf "o\nn\n\n\n\n\nw\n" | fdisk -w always /dev/vda
```

## sfdisk

delete all partitions:
```
sfdisk --delete /dev/vda
```
