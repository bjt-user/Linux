## general info

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

## fails

#### first try

```
mkosi -d debian -p systemd -p linux --autologin -f qemu
```
outputs just the usage

(This was a command from this talk:\
https://www.youtube.com/watch?v=6EelcbjbUa8)
