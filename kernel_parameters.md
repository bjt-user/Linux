https://wiki.archlinux.org/title/Kernel_parameters

https://docs.kernel.org/admin-guide/kernel-parameters.html

```
vga=   [BOOT,X86-32] Select a particular video mode
        See Documentation/x86/boot.rst and
        Documentation/admin-guide/svga.rst.
        Use vga=ask for menu.
        This is actually a boot loader parameter; the value is
        passed to the kernel using a special protocol.
```

You can set kernel parameters with the boot loader.\
The boot loader passes the parameters to the kernel.

You can check the parameters your system was booted up with by running `cat /proc/cmdline`

You can press `e` in the `grub boot menu` to temporarily set kernel parameters.\
(but it seems to be american keyboard layout)\
Press <kbd>Ctrl+x</kbd> to boot with these parameters.

> If you want to add kernel parameters during boot time on a Debian based system, edit GRUB config template at /etc/default/grub.
Add a kernel parameter in the form of name=value in GRUB_CMDLINE_LINUX_DEFAULT variable.

=> didnt do anything

> Have you tried to run the command "sudo grub-mkconfig -o /boot/grub/grub.cfg" after doing the change?

So you need to run
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
after the change of the file `/etc/default/grub`

But now it says:
```
Legacy `ask'  parameter no longer supported.
Loading initial ramdisk ...
error: you need to load the kernel first
```

using `vga=0x318` and then `grub-mkconfig -o /boot/grub/grub.cfg` didnt change the resolution (should be 1024×768x24)

vga=0x100 also doing nothing

***
`video=800x600` worked!!!

Put `video=800x600` into `/etc/default/grub`\
and then do
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
***
#### sysctl

configure kernel parameters at runtime

to see all kernel parameters
```
sysctl -a
```
