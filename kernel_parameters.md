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
