#### confusion

There is `resolv.conf` and `resolved.conf`!

#### documentation

```
man resolved.conf
```

#### set different nameserver

```
sudoedit /etc/systemd/resolved.conf
```

```
sudo systemctl restart systemd-resolved
```
