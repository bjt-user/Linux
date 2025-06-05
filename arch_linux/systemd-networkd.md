#### setup for wired connection

You need to create a file named `/etc/systemd/network/20-wired.network`.

Put this in (make sure to use the correct ethernet interface name):
```
[Match]
Name=enp2s0

[Network]
DHCP=yes
```

```
systemctl restart systemd-networkd
```

Then you should be able to
```
curl -I https://google.com
```

(Not sure if `systemd-resolved` has to be active as well...)

#### TODO: set static IP

https://wiki.archlinux.org/title/Systemd-networkd#Wired_adapter_using_a_static_IP
