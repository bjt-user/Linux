#### documentation

https://wiki.archlinux.org/title/VirtualBox

#### alternatives

`qemu`

#### installation

```
sudo pacman -S virtualbox
```

> You will also need to choose a package to provide host modules.

But not sure which kernel to choose.

## troubleshooting

#### debian error

```
WARNING: The vboxdrv kernel module is not loaded. Either there is no module
available for the current kernel (5.10.0-20-amd64) or it failed to
load. Please recompile the kernel module and install it by

sudo /sbin/vboxconfig

You will not be able to start VMs until this problem is fixed.
```

=> try to install this package `virtualbox-dkms`
=> this package seems to be only available on Ubuntu but not on Debian...

https://wiki.debian.org/VirtualBox#Debian_10_.22Buster.22_and_Debian_11_.22Bullseye.22

You have to use the "fasttrack" Repo for Debian: https://fasttrack.debian.net/

Or just use `Debian Sid/unstable`.

https://wiki.debian.org/VirtualBox#Debian_Sid.2FUnstable

=> with Debian Sid you cant install virtualbox at all because of unmet dependencies...

