to use nmcli you might need to do:
```
pacman -S networkmanager
systemctl enable NetworkManager
```
(maybe even reboot)

```
man nmcli
```

command-line tool for controlling NetworkManager

```
nmcli d wifi list
```
This lists all wifi access points in the area with `SSID`, `SIGNAL`, `RATE`, etc.

but how to connect?
