## general info

#### documentation

https://wiki.archlinux.org/title/VirtualBox

https://en.wikipedia.org/wiki/VirtualBox

> Oracle VirtualBox (formerly Sun VirtualBox, Sun xVM VirtualBox and InnoTek VirtualBox) is a hosted hypervisor for x86 virtualization developed by Oracle Corporation.

license: GPL3 except expansion packs

> A supplementary package, under a proprietary license, adds support for USB 2.0 and 3.0 devices, Remote Desktop Protocol (RDP), disk encryption, NVMe, and Preboot Execution Environment (PXE). This package is called "VirtualBox Oracle VM VirtualBox extension pack".

#### alternatives

`qemu`

## installation

```
sudo pacman -S virtualbox
```

Probably because `virtualbox` does not use `kvm` you need to install and load kernel modules.

> You will also need to choose a package to provide host modules.

But not sure which kernel to choose.

> virtualbox-host-modules-arch and virtualbox-host-dkms use systemd-modules-load.service to load VirtualBox modules automatically at boot time.\
For the modules to be loaded after installation, either reboot or load the modules once manually.

> Among the kernel modules VirtualBox uses, there is a mandatory module named vboxdrv, which must be loaded before any virtual machines can run.

> To load the module manually, run:
```
sudo modprobe vboxdrv
```
(how to make sure this module is loaded automatically at boot?)

to see the currently loaded modules:
```
lsmod
```

You can also try this command: (should show the location of the modules)
```
modinfo vboxdrv
```

#### try 2024-10-11

after installing
```
sudo pacman -S virtualbox virtualbox-host-modules-arch
```
the systemd service `systemd-modules-load.service` seems to be responsible to automatically load kernel modules \
at boot time.

```
sudo reboot
```
after the reboot the kernel module `vboxdrv` is loaded:
```
$ lsmod | grep 'vboxdrv'
vboxdrv               667648  2 vboxnetadp,vboxnetflt
```

But now virtualbox complains that it detected an i386 cpu and not x86_64...

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

