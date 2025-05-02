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

```
nmcli d wifi connect [SSID] --ask
```
Then you get prompted for a password. And then an error:
```
Failed to add/activate new connection: Not authorized to control networking.\
Because you did not use `sudo`
```
#### connect to wifi

```
sudo nmcli d wifi connect [SSID] --ask
```
This works if you enter the right password.\
Also worked once without `sudo`.

---

```
nmcli general status
```
shows if you are connected or not

```
nmcli connection show
```
shows the current connection and an old connection

#### autoconnect

Show `autoconnect` property of connections:
```
nmcli -f name,autoconnect c
```
