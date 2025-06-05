## general info

https://wiki.archlinux.org/title/Systemd-networkd

## usage

#### networkctl

```
networkctl list
```

## troubleshooting

#### first try

```
sudo systemctl stop NetworkManager
```

```
sudo systemctl start systemd-networkd
```

At first it worked but when enabling and rebooting nothing works.
