#### ejecting usb sticks

Sometimes when your file manager does not recognize the usb stick anymore \
it helps to eject it, replug it and try again.\
Assuming your usb stick is at `/dev/sdb`. (check with `fdisk -l`)
```
sudo eject -v /dev/sdb
```
Then replug the stick and the file manager might recognize it.

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
