#### reformat usb sticks

When your file manager doesnt recognize the usb stick anymore.\
Assuming your usb stick is at `/dev/sdb`. (check with `fdisk -l`)

```
sudo fdisk /dev/sdb
```

```
o
```

```
n
```
Hit Enter until its done.

```
w
```

```
sudo mkfs.fat /dev/sdb1
```

Then your file manager should recognize your usb stick again.
