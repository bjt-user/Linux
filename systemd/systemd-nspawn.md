## general info

```
man systemd-nspawn
```

> systemd-nspawn - Spawn a command or OS in a lightweight container

> systemd-nspawn may be invoked on any directory tree containing an operating system tree,\
using the --directory= command line option.

## usage

#### exit container

Hit ctrl + ] three times.

#### run on directory

You can create a tree with `mkosi` and then run it in a lightweight \
container:
```
sudo systemd-nspawn --directory=image
```

#### -b/--boot

> Automatically search for an init program and invoke it as PID 1,\
instead of a shell or a user supplied program.\
If this option is used, arguments specified on the command line are used \
as arguments for the init program.

But you need credentials to log in.

In combination with `mkosi`:
```
mkosi -d arch -p systemd,psmisc -a --format=directory
```

```
sudo systemd-nspawn -b --directory=image
```

## troubleshooting

#### image.scope already running

I did not cleanly exit a container (closed the terminal).

The name of the directory was "image".

But doing
```
sudo systemctl stop image.scope
```
helped.
