https://www.redhat.com/sysadmin/becoming-friends-networkmanager

The article shows how to change your ip and change to a static ip.\
It also shows how to change the dns server.

#### show network devices

```
nmcli device
```

#### show info about specific device

```
nmcli device show wlp2s0
```

#### show connections

```
nmcli connection
```

#### TODO: change dns server in network manager

change these and try to make them permanent and check if it will overwrite `/etc/resolv.conf`:
```
IP4.DNS[1]: 
IP4.DNS[2]:
```
