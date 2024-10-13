#### general info

https://wiki.archlinux.org/title/Archiso

https://www.youtube.com/watch?v=tSGGBbJBgvk&list=WL&index=37

It is in the `extra` repository.

It consists of 1700 lines of bash and around 500 lines of posix shell.

It is a long and cumbersome process.

#### installation

```
sudo pacman -S archiso
```

#### TODO: usage

It seems that you can use a more minimal base, but lets start with the base that is used \
for the official arch iso:
```
cp -vr /usr/share/archiso/configs/releng/ .
```

Inside this dir is a file called `packages.x86_64` that contains a list of packages \
that will be installed.

In `airootfs` is the root file system.\
You might be able to put config files in here.

In `/etc/passwd` you can create a user like this:
```
root:x:0:0:root:/root:/usr/bin/bash
myuser:x:1000:1000:myuser:/home/myuser:/usr/bin/bash
```

But then you need to create a password hash with:
```
openssl passwd -6
```
Type in the password for the user twice.

Then edit `/etc/shadow` so that it looks like this:
```
root::14871::::::
myuser:myverylonganduglyhash:14871::::::
```

TODO: continue at `/etc/gshadow`
