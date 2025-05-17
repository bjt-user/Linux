## general info

#### links

Repo: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/tree/main?ref_type=heads

Documentation: https://networkmanager.dev/

https://www.redhat.com/sysadmin/becoming-friends-networkmanager

The article shows how to change your ip and change to a static ip.\
It also shows how to change the dns server.

## usage

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

#### show specific connection
```
nmcli connection show tunsnx
```

#### FAIL: change network devices

Changing a device with
```
nmcli d modify tunsnx ipv4.dns "10.100.1.11"
```
did not work permanently, after a reboot this setting was gone

#### TODO: change dns server in network manager

change these and try to make them permanent and check if it will overwrite `/etc/resolv.conf`:
```
IP4.DNS[1]: 
IP4.DNS[2]:
```

#### what happens if you disable NetworkManager

without NetworkManager vpn doesnt work

the hostname I get without NetworkManager is "fedora"
