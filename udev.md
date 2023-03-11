udev (userspace /dev) is a device manager for the Linux kernel. As the successor of devfsd and hotplug, udev primarily manages device nodes in the /dev directory.
```
systemctl status systemd-udevd
```
there are rules in `/etc/udev/rules.d/`

Execute this command and then unplug/plug in your device to get info about the device:
```
udevadm monitor --property
```

#### get attributes of "device"

```
udevadm monitor
```

replug your device

you will get a "path" (which is not a real path on your system)

then run
```
udevadm info --attribute-walk --path /devices/pci0000:00/0000:00:02.0/drm/card1
```

You will see `ATTR`s which you might use for rules.

***
chatgpt:
> You can't do a notify-send in a udev rule.\
Udev rules are used to set up device nodes in the /dev directory and to run programs when a device is added or removed from the system.\
They are not designed to send notifications.

#### links

https://wiki.archlinux.org/title/Udev

https://en.wikipedia.org/wiki/Udev
