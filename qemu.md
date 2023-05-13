QEMU means quick emulator.

`qemu` uses `kvm` on Linux hosts.\
https://de.wikipedia.org/wiki/Kernel-based_Virtual_Machine

documentation: https://www.qemu.org/docs/master/

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

#### ssh into vm

You can ssh into a qemu vm.\
Just install `openssh-server` in the guest.\
Get the ip with `ip -4 a`. (the VM has a different IP than the host system)\
(this worked for ubuntu)

Resolving the hostname of the VM does not work.\
At least not out of the box, maybe there is a way.

And I can only ssh into the VM from the host machine, not from within the entire network.

***

#### virsh

https://www.libvirt.org/manpages/virsh.html

You have to execute `virsh` with **sudo** (!!!) to list VMs that were created with `virt-manager`:
```
sudo virsh list --all
```
generate an xml from a VM:
```
sudo virsh dumpxml ubuntu22.04 > ~/Downloads/ubuntu.xml
```

TODO: You should be able to create a new VM with that xml but you will have to change the UUID and maybe some other stuff.

```
sudo virsh start ubuntu22.04
```

```
sudo virsh shutdown ubuntu22.04
```

#### failed: launch VM in a terminal emulator

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

I think this way of using qemu is only meant to work with kernel images.\
To test kernels fast. But not for installing a distribution iso.

***

#### TODO: create vm from command line

First create a disk:
```
$ qemu-img create -f qcow2 myimage.img 10G
Formatting 'myimage.img', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=10737418240 lazy_refcounts=off refcount_bits=16
$ file myimage.img 
myimage.img: QEMU QCOW Image (v3), 10737418240 bytes (v3), 10737418240 bytes
```

create the VM:
```
qemu-system-x86_64 --enable-kvm -cdrom archlinux-x86_64.iso -hda myimage.img -m 2G
```

And then launch `tigervnc` on another window on port 5900.

Install Arch Linux. And then shutdown the VM instead of reboot.

Start the VM:
```
qemu-system-x86_64 --enable-kvm -hda myimage.img -m 2G
```

But **no internet**!

Just copying the file into `/var/lib/libvirt/images` where virtualmanager images are doesnt make it available there...

#### TODO: network bridge

The goal is to be able to ssh into VM from anywhere in the network, currently I am only able to ssh into local VMs.

https://wiki.archlinux.org/title/Network_bridge
```
sudo ip link add name my_qemu_bridge type bridge
```
You can see this bridge with `ip a` now.

```
ip link set dev my_qemu_bridge up
```

`wlp2s0` is already `UP`.

This should make the bridge the master of the wireless device:
```
ip link set wlp2s0 master my_qemu_bridge
Error: Device does not allow enslaving to a bridge.
```

ChatGPT knows:
> Some types of interfaces, such as Wi-Fi or virtual interfaces, may not support bridging.\
Only physical Ethernet interfaces typically allow bridging.

So I delete it again
```
sudo ip link set my_qemu_bridge down
sudo ip link delete my_qemu_bridge type bridge
```

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
