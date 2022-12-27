what to do when you can't resolv an IP in your network:
```
$ nslookup 192.168.2.166
** server can't find 166.2.168.192.in-addr.arpa: NXDOMAIN
```

check if dns is managed by `systemd`
```
systemctl status systemd-resolved
```

check your `resolv.conf`
```
cat /etc/resolv.conf
```

When you change your `resolv.conf` and reboot, `NetworkManager` will overwrite your changes to `resolv.conf`.

To check if `NetworkManager` is enabled:
```
systemctl status NetworkManager
```

