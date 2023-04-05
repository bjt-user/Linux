#### resources

https://kernelnewbies.org/KernelBuild

There is a book called "linux in a nutshell" from Greg Kroah-Hartman.\
It should be a free ebook that you can get online somewhere.\
In that book is explained how to build and install a kernel.

There is nothing about building a kernel here: https://doc.lagout.org/operating%20system%20/linux/Linux%20in%20a%20Nutshell,%206th%20Ed.pdf

This is it: http://www.kroah.com/lkn/

***

#### kernel configuration

Many kernel drivers can be turned on or off, or built as modules.\
When you download the source tree, it doesn't come with a .config file.

Making the default config:\
Remember, a default config may not have the options you are currently using. Run
```
make defconfig
```

```
$ make defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
$ wc -l .config 
5162 .config
```

Compiling a kernel from scratch from a distribution configuration can take "forever" because the distros turn on every hardware configuration possible.\
For people wanting to do kernel development fast, you want to make a minimal configuration.\
Steve Rostedt uses ktest.pl make_min_config to get a truly minimum config, but it will take a day or two to build.\
Warning: make sure you have all your USB devices plugged into the system, or you won't get the drivers for them!

If you need to make any changes to your configuration, you can run one of the following commands. These require the curses tools to be installed.
```
make menuconfig
```
or
```
make nconfig
```

Building the kernel

Run
```
make
```
Or, if you have a multi-core processor, run
```
make -jX
```
Where X is a number like 2 or 4. If you have a dual core, 2 or 3 might be good. Quad core, 4 or 6. Do not run with really big numbers unless you want your machine to be dog-slow! 

So I try a
```
time make
```
on the Intel Celeron machine...

```
/bin/sh: line 1: bc: command not found
```

```
sudo pacman -S bc
```

```
time make
```

```
...
Kernel: arch/x86/boot/bzImage is ready  (#1)
...

real	109m12.873s
user	96m2.161s
sys	10m56.667s
```

```
sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux-6.2-bf
```

set `GRUB_TIMEOUT` to 5 seconds in `/etc/default/grub`

then:
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

```
sudo reboot
```

=> over advanced options in grub I could boot into the compiled kernel\
but no internet, so probably the wifi module was not loaded

I might also need to compile and include the kernel modules somehow.

```
$ time sudo make modules_install
  INSTALL /lib/modules/6.2.0/kernel/fs/efivarfs/efivarfs.ko
  INSTALL /lib/modules/6.2.0/kernel/drivers/thermal/intel/x86_pkg_temp_thermal.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/nf_log_syslog.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/xt_mark.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/xt_nat.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/xt_LOG.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/xt_MASQUERADE.ko
  INSTALL /lib/modules/6.2.0/kernel/net/netfilter/xt_addrtype.ko
  INSTALL /lib/modules/6.2.0/kernel/net/ipv4/netfilter/iptable_nat.ko
  DEPMOD  /lib/modules/6.2.0

real	0m0.950s
user	0m0.554s
sys	0m0.355s
```

Then I try to reboot into the kernel again.

***
#### try: building a kernel

First problem: where to get the kernel source code?

go to https://git.kernel.org and search for "linus torvalds"

This could be it:
```
kernel/git/torvalds/linux.git	Linux kernel source tree	Linus Torvalds	12 hours	summarylogtree
```

**warning: this takes very long:**
```
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
```
and it is 4.3G big.

It's probably not a stable kernel though.

You can also download tarballs from here:\
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

```
$ time wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.2.tar.gz
...
real	1m20.510s
```

```
$ time tar -xf linux-6.2.tar.gz 

real	0m17.738s
user	0m10.462s
sys	0m12.495s
```

This was way faster than doing a git clone...

***
