udev (userspace /dev) is a device manager for the Linux kernel. As the successor of devfsd and hotplug, udev primarily manages device nodes in the /dev directory.
```
systemctl status systemd-udevd
```
there are rules in `/etc/udev/rules.d/`

Execute this command and then unplug/plug in your device to get info about the device:
```
udevadm monitor --property
```


#### links

https://wiki.archlinux.org/title/Udev

https://en.wikipedia.org/wiki/Udev
