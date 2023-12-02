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

#### disk label

```
EMPTY DISK LABEL
       sfdisk does not create partition table without partitions by default.
	   The lines with partitions are expected in the
       script by default.
	   The empty partition table has to be explicitly requested by "label: <name>" script header line
       without any partitions lines. For example:

          echo 'label: gpt' | sfdisk /dev/sdb

       creates empty GPT partition table. Note that the --append disables this feature.
```
