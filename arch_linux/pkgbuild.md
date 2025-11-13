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

#### makedepends

> makedepends (array)
> An array of packages this package depends on to build but are not needed at runtime.
> Packages in this list follow the same format as depends.

## packaging functions

#### build()

> The optional build() function is used to compile and/or adjust the \
source files in preparation to be installed by the package() function.\
This function is run inside $srcdir.

#### package()

> package() Function \
The package() function is used to install files into the directory \
that will become the root directory of the built package and is run after \
all the optional functions listed below.\
The packaging stage is run using fakeroot to ensure correct file permissions in \
the resulting package.\
All other functions will be run as the user calling makepkg.\
This function is run inside $srcdir.

## examples

https://gitlab.archlinux.org/archlinux/packaging/packages/fastfetch
