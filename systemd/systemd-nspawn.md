## general info

```
man systemd-nspawn
```

> systemd-nspawn - Spawn a command or OS in a lightweight container

> systemd-nspawn may be invoked on any directory tree containing an operating system tree,\
using the --directory= command line option.

## usage

#### run on directory

You can create a tree with `mkosi` and then run it in a lightweight \
container:
```
sudo systemd-nspawn --directory=image
```
