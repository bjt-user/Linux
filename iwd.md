## usage

#### configure ssid and passphrase

create `/var/lib/iwd/<SSID>.psk` with the following content:
```
[Security]
Passphrase=<Passphrase>
```

#### start service
```
systemctl start iwd
```

#### scan network

```
iwctl
```
```
[iwd]# station list
```

```
[iwd]# station wlan0 scan 
[iwd]# station wlan0 get-networks
```

#### connect to an ssid

If your wifi interface name is `wlan0`:
```
station wlan0 connect <SSID>
```
