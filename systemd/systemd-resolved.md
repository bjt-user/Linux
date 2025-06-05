## general info

#### documentation

```
man systemd-resolved
```

```
man resolved.conf
```

#### set a search domain

When `nslookup` does not resolve hosts without the FQDN \
you can add the `Domains` directive to the systemd-networkd config:
```
$ cat /etc/systemd/network/20-wired.network
[Match]
Name=enp2s0

[Network]
DHCP=yes
Domains=speedport.ip
```

```
sudo systemctl restart systemd-networkd systemd-resolved
```

## set nameserver

#### globally

```
sudoedit /etc/systemd/resolved.conf
```

```
sudo systemctl restart systemd-resolved
```

#### for a specific link

```
resolvectl dns enp2s0 [ip]
```

But in which config file is this writtin into???

## troubeshooting

#### confusion!

There is `resolv.conf` and `resolved.conf`!
