#### libvirt

libvirt is a collection of programs that helps with the management of virtual machines.

#### virt-install

This created an instance named `virt-install-test`:
```
virt-install --cdrom alpine-standard-3.20.1-x86_64.iso --name virt-install-try-2 --noautoconsole
```
You need `--noautoconsole` so it does not try to start it with `virt-viewer`.

```
$ virsh list
 Id   Name                State
-----------------------------------
 1    virt-install-try-2   running
```

To destroy your instance (or "domain"):
```
virsh destroy 1
```

But `virt-viewer` is better because the text console does not show everything (boot messages).

```
sudo pacman -S virt-viewer
```

```
virt-install --cdrom alpine-standard-3.20.1-x86_64.iso --name virt-install-try-3
```

## virsh

#### virsh list

show all VMs (domains):
```
virsh list --all
```

#### virsh start

```
virsh start [domain_name]
```

#### virsh console

Connect to a text console
```
virsh console virt-install-try-2
```
or use the id
```
virsh console 3
```

You have to exit this console with control + `]`.

#### virsh undefine

```
virsh # list --all
 Id   Name                 State
-------------------------------------
 -    virt-install-test    shut off
 -    virt-install-try-2   shut off

virsh # undefine virt-install-test
Domain 'virt-install-test' has been undefined

virsh # list --all
 Id   Name                 State
-------------------------------------
 -    virt-install-try-2   shut off
```
