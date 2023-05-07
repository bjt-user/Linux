QEMU means quick emulator.

`qemu` uses `kvm` on Linux hosts.\
https://de.wikipedia.org/wiki/Kernel-based_Virtual_Machine

#### installation

You have to install the packages `qemu-system-x86`, `virt-manager`, and depending on the distribution you also need `libvirt` or `libvirt-client`.

Fedora-Install:
```
sudo dnf install qemu-system-x86 virt-manager libvirt-client
```

Arch-Install:
```
sudo pacman -S qemu-system-x86 virt-manager qemu-img
```

You have to enable (and start) `libvirtd` (on some distributions, like Fedora):
```
sudo systemctl enable --now libvirtd
```

You have to start `virt-manager` as root.\
Otherwise on Ubuntu the connection to `QEMU/kvm` will fail.

#### cpu virtualization support

If your cpu does not have virtualization support enabled, the VMs will be extremely slow and\
might even crash your system.
```
cat /proc/cpuinfo | grep -i "vmx"
```
If the `vmx` flag is present, then it supports virtualization.

If the flag is not there you have to enable it in BIOS.

Lenovo Thinkcentre: F1 on booting

enable "Intel Virtualization Support"

## usage

looks like you can create virtual machines by using the `virt-manager` program.

#### keyboard shortcuts

<kbd>ctrl (left)</kbd> + <kbd>alt (left)</kbd> - grab keyboard from or to vm

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


#### snapshots

## troubleshooting

It looks like `qemu` only starts from the iso file the first time and when you don't install the operating system right after the first boot you cant boot from the iso file anymore, which is weird.\
Shouldnt it be possible to also set snapshots during isntallation?

Now I get
```
no bootable device
```
and cant seem to recover from that

#### network 'default' is not active

Error starting domain: Requested operation is not valid: network 'default' is not active

see the networks:
```
sudo virsh net-list --all
```

start the default network:
```
sudo virsh net-start default
```

=> the `default` network does not seem to start at boot time maybe you can make it auto start as well

```
sudo virsh net-autostart default
```

#### Unable to find 'dnsmasq' binary in $PATH

On Arch Linux cant start the default network.

```
sudo pacman -S dnsmasq
```

***

#### No active connection to Installed on

error message `no active connection to install on` when trying to create a vm, can be solved \
by adding the user to the `libvirt` group:
```
sudo usermod -aG libvirt bf
```

***
