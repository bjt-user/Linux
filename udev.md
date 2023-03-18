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

You might need to do this to make the changes take effect:
``` 
 $ sudo udevadm control --reload-rules
```

You should be able to specify a script in a udev rule:
```
KERNEL=="sd*", SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk", ENV{ID_SERIAL_SHORT}=="<your_usb_device_serial_number>", RUN+="/path/to/your/command.sh"
```

#### links

https://wiki.archlinux.org/title/Udev

https://en.wikipedia.org/wiki/Udev
