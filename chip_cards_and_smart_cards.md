## general info

https://wiki.archlinux.org/title/Smartcards

```
$ sudo pacman -Si ccid
Repository      : extra
Name            : ccid
Version         : 1.7.1-1
Description     : A generic USB Chip/Smart Card Interface Devices driver
Architecture    : x86_64
URL             : https://ccid.apdu.fr/
Licenses        : LGPL  GPL
Groups          : None
Provides        : None
Depends On      : pcsclite  libusb  flex
Optional Deps   : None
Conflicts With  : None
Replaces        : None
Download Size   : 83.09 KiB
Installed Size  : 263.58 KiB
Packager        : Christian Hesse <eworm@archlinux.org>
Build Date      : Thu 05 Feb 2026 07:49:10 AM CET
Validated By    : SHA-256 Sum  Signature
```

#### installation

```
sudo pacman -S ccid pcsclite
```

## usage

#### scan for readers and cards

```
sudo systemctl start pcscd
```

```
pcsc_scan
```
The chip of the card has to point upwards.

It works with debit cards, most other cards will just return \
"unresponsive card".
