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

<kbd>ctrl (left) + alt (left)</kbd> - grab keyboard from or to vm

***

#### first try using virt-manager

```
sudo virt-manager
```

click on `create a new virtual machine` -> local isntall media

browse->browse local-> archlinux iso ausgewählt

Then a popup comes up `root may not have permissions for the file...do you want to change this now?`\
-> yes

...

then a new window pops up and I have a new VM.

worked well at was easy to set up

but id like to have the VM inside my `terminator` \
right now using `virt-manager` is clunky because I have to click it so it caches my keyboard.

***

#### todo: launch VM in a terminal emulator

1. create a virtual image

This creates a virtual image that can store 10GB of data:
```
qemu-img create -f qcow2 arch.img 10G
```

this should start the VM based on the .iso file:
```
qemu-system-x86_64 -enable-kvm -cdrom archlinux-2022.09.03-x86_64.iso -boot menu=on -drive file=arch.img -m 2G
```
-m sets the ammount of RAM

=> qemu is opened in a separate window \
==> thats NOT what we want

so we try to add another option\
https://stackoverflow.com/questions/6710555/how-to-use-qemu-to-run-a-non-gui-os-on-the-terminal

`-nographic`

Normally, QEMU uses SDL to display the VGA output. With this option, you can totally disable graphical output so that QEMU is a simple command line application. The emulated serial port is redirected on the console. Therefore, you can still use QEMU to debug a Linux kernel with a serial console.

`-curses`

Normally, QEMU uses SDL to display the VGA output. With this option, QEMU can display the VGA output when in text mode using a curses/ncurses interface. Nothing is displayed in graphical mode.

```
qemu-system-x86_64 -enable-kvm -cdrom archlinux-2022.09.03-x86_64.iso -boot menu=on -drive file=arch.img -m 2G -nographic
```

=> that didnt work so well

```
$ qemu-system-x86_64 -enable-kvm -cdrom archlinux-2022.09.03-x86_64.iso -boot menu=on -drive file=arch.img -m 2G -nographic -curses
qemu-system-x86_64: -curses: warning: -curses is deprecated, use -display curses instead.
```

this also didnt work:
```
qemu-system-x86_64 -enable-kvm -cdrom archlinux-2022.09.03-x86_64.iso -boot menu=on -drive file=arch.img -m 2G -nographic -display curses
```

this also didnt work:
```
qemu-system-x86_64 -enable-kvm -cdrom archlinux-2022.09.03-x86_64.iso -boot menu=on -drive file=arch.img -m 2G -nographic -display curses -append 'console=ttyS0'
```
qemu-system-x86_64: -append only allowed with -kernel option
