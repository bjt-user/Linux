## general info

#### description

> Alternative to locate, faster and compatible with mlocate's database.

Written in C++.

##### documentation

https://plocate.sesse.net/

Gitrepo is only accessible over IPv6:\
https://git.sesse.net/?p=plocate

> NOTE: These git repositories are only available over IPv6.\
To send a patch to any of these projects, just do “git push”, and I will receive an email with your patch.\
Remember to set the committer email appropriately!

```
git clone https://git.sesse.net/plocate
```

#### installation

```
sudo pacman -S plocate
```

Installed executables:
```
plocate usr/bin/locate
plocate usr/bin/mlocate
plocate usr/bin/plocate
plocate usr/bin/plocate-build
plocate usr/bin/updatedb
```
(`locate` and `mlocate` are symlinks to `plocate`)

Installed manpages:
```
plocate usr/share/man/man1/plocate.1.gz
plocate usr/share/man/man5/updatedb.conf.5.gz
plocate usr/share/man/man8/plocate-build.8.gz
plocate usr/share/man/man8/updatedb.8.gz
```

Installed config files:
```
plocate etc/updatedb.conf
```

## usage

#### updatedb

```
sudo updatedb
```

That will fill the db:
```
$ sudo wc -l /var/lib/plocate/plocate.db
41284 /var/lib/plocate/plocate.db
```

This will normally be done with a systemd timer.

#### search for a file

```
locate 'stdio.h'
```

#### search the basename of a file with regex

This will not search the string in the entire path,\
but only in the basenames:
```
locate -b -r "^string\.h$"
```

## troubleshooting

#### no such file

directly after installing:
```
$ locate "stdio.h"
pread: No such file or directory
```

Maybe because `/var/lib/plocate/plocate.db` is empty directly after installing \
and `locate` can be used only after this db fills over night?

Yes.

A better error message would be nice.

Solution:
```
sudo updatedb
```
