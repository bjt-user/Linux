## iso images

for a stable release go to:\
https://www.debian.org/download

You can get daily images on:\
https://d-i.debian.org/

According to "distrotube" you can get the unofficial, unstable Branch (`sid`) here:\
https://d-i.debian.org/daily-images/amd64/daily/netboot/mini.iso \
(Debian is meant to be installed with the "stable" branch, so this is an unofficial release)


#### TODO: using the unstable branch

https://wiki.debian.org/SourcesList

If you have installed the stable release (i.e. `bullseye`), your `/etc/apt/sources.list` may look something like this:
```
# 

# deb cdrom:[Debian GNU/Linux 10.9.0 _Buster_ - Official amd64 NETINST 20210327-10:38]/ buster main

#deb cdrom:[Debian GNU/Linux 10.9.0 _Buster_ - Official amd64 NETINST 20210327-10:38]/ buster main

deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main

#deb http://security.debian.org/debian-security bullseye/updates main
#deb-src http://security.debian.org/debian-security bullseye/updates main

deb http://security.debian.org/debian-security bullseye-security main contrib non-free

# buster-updates, previously known as 'volatile'
deb http://deb.debian.org/debian/ bullseye-updates main
deb-src http://deb.debian.org/debian/ bullseye-updates main

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.
```

According to the wiki you should change the distribution string `bullseye` to `unstable`,\
and then do an `apt update && apt upgrade`.

