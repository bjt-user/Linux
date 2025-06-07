## general info

https://wiki.archlinux.org/title/Systemd-networkd

## configuration

#### simple dhcp config for ethernet

This worked:
```
[Match]
Name=enp2s0

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
Domains=speedport.ip
```

#### static IP config for ethernet

This worked:
```
[Match]
Name=enp2s0

[Link]
RequiredForOnline=routable

[Network]
Address=192.168.2.199/24
Gateway=192.168.2.1
DNS=192.168.2.1
Domains=speedport.ip
```

#### wireless adapter with dhcp

```
[Match]
Name=wlp1s0

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
IgnoreCarrierLoss=3s
```

## usage

#### list and status

```
networkctl list
```

```
networkctl status
```

#### reload config

You dont need to restart the service, just do:
```
networkctl reload
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

=> `Gateway` and `DNS` are missing
