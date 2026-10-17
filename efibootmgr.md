## installation

```
sudo pacman -S efibootmgr
```

## usage

#### list boot entries

```
efibootmgr
```

#### remove boot entry

To remove the first boot entry which was called "Boot0000":
```
efibootmgr -b 0 -B
```
It was a boot entry with the descripion "Windows Boot Manager" even though \
Windows was not installed anymore on this system...

#### remove boot order

```
efibootmgr -O
```

After that it will show:
```
No BootOrder is set; firmware will attempt recovery
```
