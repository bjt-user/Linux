## general info

https://wiki.archlinux.org/title/Mkosi

```
man mkosi
```

> mkosi - Build Bespoke OS Images

#### installation

```
sudo pacman -S mkosi
```

## usage

#### mkosi init

```
mkosi init
```
Creates this file `${PATH}/.config/user-tmpfiles.d/mkosi.conf`.\
With this content:\
```
# SPDX-License-Identifier: LGPL-2.1-or-later

d %C/mkosi - - - 90d
```
And nothing else.

Arguments after `init` are not supported.

#### without arguments

If you run
```
mkosi
```
without arguments it will generate an `image.raw` and a symlink \
to that file in the current dir.

The `image.raw` was 34 megabytes in size.\
According to `file` it is a `DOS/MBR boot sector; partition 1 : ID=0xee, start-CHS...` file.

TODO: Is this bootable from bare metal?\
=> according to Archwiki and Poettering it is.

It can NOT be booted by `systemd-nspawn`:
```
systemd-nspawn --boot --image image.raw
```
```
Failed to allocate user namespace with 64K users: No such file or directory
```

https://github.com/systemd/systemd/issues/35387

Seems like an issue on Arch Linux, maybe try it on Rocky Linux?

## fails

#### first try

```
mkosi -d debian -p systemd -p linux --autologin -f qemu
```
outputs just the usage

(This was a command from this talk:\
https://www.youtube.com/watch?v=6EelcbjbUa8)
