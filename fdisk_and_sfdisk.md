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

from man page:
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

```
echo 'label: gpt' | sfdisk /dev/vda
```

#### create EFI boot partition

start off clean (delete old partition tables):
```
dd if=/dev/zero of=/dev/vda bs=2048 count=1 status=progress
```

create empty gpt disk label:
```
echo 'label: gpt' | sfdisk /dev/vda
```

This will create a boot partition (type Linux):
```
echo 'start=2048, size=200M, bootable' | sfdisk /dev/vda
```

Make it type "EFI": (U is an alias for `uefi`)
```
echo -e 'type=U' | sfdisk -N 1 /dev/vda
```

#### create new partition

this created a first partition starting at 2048:
```
echo -e 'type=uefi, size=200M' | sfdisk -N 1 /dev/vda
```

#### TODO: create main partition

How to create the second partition that just fills out the remaining space without specifying a size?

## troubleshooting

#### contains vfat signature

There can arrive a message:
```
Partition #1 contains a vfat signature.

Do you want to remove the signature? [Y]es/[N]o:
```

This will make it hard to script `fdisk`!\
Wiping the entire disk made this message disappear:
```
dd if=/dev/zero of=/dev/vda bs=1M status=progress
```
but MAYBE zeroing only the first bytes might be enough:
```
dd if=/dev/zero of=/dev/vda bs=2048 count=1 status=progress
```

using `wipefs --all --force /dev/vda` does NOT work!
