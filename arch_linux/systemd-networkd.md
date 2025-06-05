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
