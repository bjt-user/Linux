#### libvirt

https://libvirt.org/

libvirt is a collection of programs that helps with the management of virtual machines.

The libvirt project:
- is a toolkit to manage virtualization platforms
- is accessible from C, Python, Perl, Go and more
- is licensed under open source licenses
- supports KVM, Hypervisor.framework, QEMU, Xen, Virtuozzo, VMWare ESX, LXC, BHyve and more
- targets Linux, FreeBSD, Windows and macOS

## virt-install

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

Once I have manually installed the alpine os, I could connect to the machine like this:
```
virt-viewer virt-install-try-3
```
Of course this only works if the machine is in a `running` state.\
You can `start/suspend` the machine with `virsh`.

Using the id also works:
```
$ virsh list --all
 Id   Name                 State
------------------------------------
 3    virt-install-try-3   running

$ virt-viewer 3
```

#### specify RAM and number of CPUs

4GB RAM and 2 CPUs:
```
virt-install --cdrom alpine-standard-3.20.1-x86_64.iso --name virt-install-try-4 --noautoconsole --memory 4096 --vcpus 2
```

## virt-viewer

virt-viewer seems to use `libvirt` domain names and ids.

```
$ virsh list --all
 Id   Name                 State
------------------------------------
 3    virt-install-try-3   running

$ virt-viewer 3
```
or
```
virt-viewer virt-install-try-3
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

#### storage pools

```
virsh pool-list
```

```
virsh # pool-list
 Name        State    Autostart
---------------------------------
 default     active   yes
 Downloads   active   yes
 libvirt     active   yes
```

This will show the "target path" of a storage pool:
```
virsh # pool-dumpxml default
<pool type='dir'>
  <name>default</name>
  <uuid>c70b93dc-5b04-4958-83da-5654bd12a1da</uuid>
  <capacity unit='bytes'>125425360896</capacity>
  <allocation unit='bytes'>63066734592</allocation>
  <available unit='bytes'>62358626304</available>
  <source>
  </source>
  <target>
    <path>/home/myuser/.local/share/libvirt/images</path>
    <permissions>
      <mode>0711</mode>
      <owner>1000</owner>
      <group>998</group>
    </permissions>
  </target>
</pool>
```
