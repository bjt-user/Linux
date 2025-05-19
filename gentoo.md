#### stage3 files/containers

https://wiki.gentoo.org/wiki/Stage_file

You can download stage 3 files from gentoo.org/downloads

This is a tar.gz of a root file system.\
It can be used as a docker container or wsl distro.

But it does not have `vi` or `vim` installed.

Before you can install packages in this container:
```
emerge --sync
```

This worked for installing `vim`:
```
emerge --ask --verbose vim
```
(took about 1-2 minutes)
