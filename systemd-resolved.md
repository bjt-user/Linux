#### confusion

There is `resolv.conf` and `resolved.conf`!

#### documentation

```
man resolved.conf
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

But in which config file is this writtin into?
