## general info

#### description

> Alternative to locate, faster and compatible with mlocate's database.

##### documentation

https://plocate.sesse.net/

Gitrepo seems to be down:\
https://git.sesse.net/?p=plocate

#### installation

```
sudo pacman -S plocate
```

## troubleshooting

#### TODO: no such file

directly after installing:
```
$ locate "stdio.h"
pread: No such file or directory
```

Maybe because `/var/lib/plocate/plocate.db` is empty directly after installing \
and `locate` can be used only after this db fills over night?
