Raspberry Pi OS is different from most Linux distros...

#### keyboard layout

```
dpkg-reconfigure keyboard-configuration
```

then do
```
sudo reboot
```

#### openssh

`openssh-server` and `openssh-client` were installed but not in `systemd`...

You have to enable it by typing
```
sudo raspi-config
```
3 interface options -> I2 SSH

Then use
```
hostname -I
```
to get the IP

Because DNS will only work after a successful connect with the IP...
