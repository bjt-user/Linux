## general info

https://wiki.archlinux.org/title/IPv6

## configuration

#### disable ipv6

https://wiki.archlinux.org/title/IPv6#Disable_IPv6

> This should not be done blindly:\
for most users, IPv4-only networking will degrade performance behind Carrier-grade NAT and \
hamper their usage of P2P or WebRTC applications (e.g. some games).\
Instead, configuring IPv4 to be preferred over IPv6 is the best of both worlds.

```
https://wiki.archlinux.org/title/IPv6
```

Disabling through kernel parameters works:\
`/etc/default/grub`:
```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 ipv6.disable=1"
```

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
