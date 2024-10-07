https://en.wikipedia.org/wiki/Initial_ramdisk

> In Linux systems, initrd (initial ramdisk) is a scheme for loading a temporary root file system into memory, to be used as part of the Linux startup process.
initrd and initramfs (from INITial RAM File System) refer to two different methods of achieving this.

https://developer.ibm.com/articles/l-initrd/

> The initial RAM disk (initrd) is an initial root file system that is mounted prior to when the real root file system is available.
In the case of desktop or server Linux systems, the initrd is a transient file system. Its lifetime is short, only serving as a bridge to the real root file system. In embedded systems with no mutable storage, the initrd is the permanent root file system.

#### todo: boot into initrd

chatgpt said:

To boot into initrd, you will need to access your computer's boot menu or setup utility. The process for doing this can vary depending on your specific computer and operating system.

Typically, you will need to press a key, such as F2 or Del, while your computer is starting up to access the setup utility. Once you are in the setup utility, look for an option to select the boot device or boot order. You should see an option to boot from the initrd.

You can also use the command line to boot into initrd. You will need to edit the boot loader's configuration file, usually located at /etc/grub.conf or /etc/grub.d/40_custom and add the following line:

```
initrd /path/to/initrd.img
```

After making the changes, update the grub configuration by running:

```
sudo update-grub
```
Next time when you reboot, you will be able to select the initrd from the grub menu.
