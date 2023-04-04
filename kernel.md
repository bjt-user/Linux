#### TODO: build a kernel

https://kernelnewbies.org/KernelBuild

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
