QEMU means quick emulator.

`qemu` uses `kvm` on Linux hosts.\
https://de.wikipedia.org/wiki/Kernel-based_Virtual_Machine

I think qemu should work even if your CPU doesnt support kvm.

to find out if your CPU supports virtualization (most modern cpus should support it):
```
cat /proc/cpuinfo | grep -i "vmx"
```
If the `vmx` flag is present, then it supports virtualization.

#### installation

You have to install the packages `qemu-system-x86`, `virt-manager`, and depending on the distribution you also need `libvirt` or `libvirt-client`.

Fedora-Install:
```
sudo dnf install qemu-system-x86 virt-manager libvirt-client
```

You have to enable (and start) `libvirtd` (on some distributions, like Fedora):
```
sudo systemctl enable --now libvirtd
```

#### usage

looks like you can create virtual machines by using the `virt-manager` program.

***

#### first try

```
sudo virt-manager
```

click on `create a new virtual machine` -> local isntall media

browse->browse local-> archlinux iso ausgewählt

Then a popup comes up `root may not have permissions for the file...do you want to change this now?`\
-> yes

...

then a new window pops up and I have a new VM.
