## general info

https://github.com/systemd/mkosi

https://wiki.archlinux.org/title/Mkosi

```
man mkosi
```

> mkosi - Build Bespoke OS Images

Written in Python.

#### installation

```
sudo pacman -S mkosi
```

#### output formats

From the manpage:
```
The following output formats are supported:

   • Raw GPT disk image, created using systemd-repart (disk)

   • Plain directory, containing the OS tree (directory)

   • Tar archive (tar)

   • CPIO archive (cpio)

   • Unified Kernel Image (UKI)

   • ...  and much more.  See Format= documentation below.
```

## configuration

> `mkosi.local.conf` and `mkosi.local/` are parsed if they exists (in that order).\
This file and directory should be in `.gitignore` (or equivalent) \
and are intended for local configuration.

> `mkosi.conf` is parsed if it exists in the directory configured \
with `--directory=` or the current working directory if `--directory=` is \
not used.\
If the specified directory does not contain a `mkosi.conf` or `mkosi.tools.conf` \
and a `mkosi/mkosi.conf` or `mkosi/mkosi.tools.conf` exists, the configuration \
will be parsed from the `mkosi/` subdirectory of the specified directory instead.

> `mkosi.conf.d/`  is  parsed  in the same directory as `mkosi.conf` if it exists.\
Each directory and each file with the `.conf` extension in `mkosi.conf.d/` is parsed.\
Any directory in `mkosi.conf.d` is parsed as if it were a regular top level \
directory,  except  for  `mkosi.images/` and `mkosi.tools.conf`,\
which are only picked up in the top level directory.

> If any profiles are configured, their configuration is parsed from the \
`mkosi.profiles/` directory.

> Subimages are parsed from the `mkosi.images/` directory if it exists.

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

#### create a directory tree

```
mkosi --format=directory
```

#### -d/--distribution

> choose from fedora, debian, kali, ubuntu, postmarketos, arch, opensuse, \
mageia, centos, rhel, rhel-ubi, openmandriva, rocky, alma, azure, custom, )

```
$ mkosi -d rocky --format=directory
‣ Validating certificates and keys
‣ RPM-GPG-KEY-Rocky-10 GPG key not found in /usr/share/distribution-gpg-keys or /etc/pki/rpm-gpg
‣ (Make sure the distribution-gpg-keys package is installed)
```

It is probably this package that is missing:
```
$ sudo pacman -Ss distribution-gpg-keys
extra/distribution-gpg-keys 1.117-1
    GPG keys used by various Linux distributions to sign packages
```

For `arch` it works without those keys. (maybe because it was the host)

#### -p/--package=

To install the systemd package in arch linux:
```
mkosi -d arch --format=directory -p systemd
```

For multiple package, separate them by comma:
```
mkosi -d arch --format=directory -p systemd,psmisc
```

#### -a/--autologin

Then you can boot into the image with `systemd-nspawn` without authentication.

## fails

#### first try

```
mkosi -d debian -p systemd -p linux --autologin -f qemu
```
outputs just the usage

(This was a command from this talk:\
https://www.youtube.com/watch?v=6EelcbjbUa8)
