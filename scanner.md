https://wiki.archlinux.org/title/SANE

https://wiki.archlinux.org/title/SANE/Scanner-specific_problems

plug in your scanner and turn it on
```
sudo sane-find-scanner
```

but
```
scanimage -L
```
says no device found...

https://developers.hp.com/hp-linux-imaging-and-printing/

=> it gives you a shell script that you have to execute and it seems to only work for specific distros\
=> maybe install a listed distro in a VM

#### hp scanners

```
sudo pacman -S hplip
```

#### necessary packages

You will need the `sane` package.

This is needed to detect wireless scanners:
```
sudo pacman -S sane-airscan
```

#### works in ubuntu vm but not in arch linux

Got my scanner working in a qemu VM with Ubuntu 22.04 by just installing `simple-scan`.

So what is the difference between the Ubuntu 22.04 VM and the Arch Linux system?

```
$ sudo pacman -S hplip
extra/hplip 1:3.23.5-1
    Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet
```

=> then it also works on Arch!

#### find network scanners

```
airscan-discover
```

#### scanner in the network

```
sudoedit /etc/sane.d/net.conf
```
just put in the IP of the scanner in one line `192.168.2.xxx`

Then when you do a `sudo scanimage -L` it actually finds the network scanner.

Then even `simple-scan` will find it!\
(but dont hit the search button a second time after launching the program then it will not find it again)

#### simple-scan

You usually have to "refresh the device list" twice to find the scanner.
