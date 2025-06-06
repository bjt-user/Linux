## general info

https://wiki.archlinux.org/title/Systemd-networkd

## usage

#### networkctl

```
networkctl list
```

```
networkctl status
```

## troubleshooting

#### first try

```
sudo systemctl stop NetworkManager
```

```
sudo systemctl start systemd-networkd
```

At first it worked but when enabling and rebooting nothing works.

#### Fail: setting static IP

This did not work (no internet connection at all):
```
[Match]
Name=enp2s0

[Link]
RequiredForOnline=routable

[Network]
Address=192.168.2.199/24
DHCP=no
Domains=speedport.ip
```
