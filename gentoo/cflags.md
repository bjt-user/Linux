#### package specific CFLAGS

```
mkdir -pv /etc/portage/env
```

```
vim /etc/portage/env/debug_cflags.conf
```

Put this in:
```
CFLAGS="-g -O0"
CXXFLAGS="-g -O0"
```

```
mkdir -pv /etc/portage/package.env
```

```
vim /etc/portage/package.env/vim
```

Paste this in:
```
app-editors/vim debug_cflags.conf
```

Rebuild the package.

```
$ emerge --info vim | grep "CFLAGS"
CFLAGS="-O2 -pipe"
FCFLAGS="-O2 -pipe"
CFLAGS="-g -O0"
```
