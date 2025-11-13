## general info

```
man 5 PKGBUILD
```

https://wiki.archlinux.org/title/PKGBUILD

> A PKGBUILD is a Bash script containing the build information required by Arch Linux packages.

## variables

#### source

If you include a git repo like this, `makepkg` will clone the BARE repo into \
the current dir:
```
source=('git+https://gittea.dev/bjoernf/countdown.git')
```
And to fix this error:
```
==> ERROR: Integrity checks are missing for: source
```
You need this line:
```
cksums=('SKIP')
```

## packaging functions

#### build()

The optional build() function is used to compile and/or adjust the \
source files in preparation to be installed by the package() function.\
This function is run inside $srcdir.

## examples

https://gitlab.archlinux.org/archlinux/packaging/packages/fastfetch
