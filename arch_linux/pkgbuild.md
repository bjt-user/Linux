## general info

```
man 5 PKGBUILD
```

https://wiki.archlinux.org/title/PKGBUILD

> A PKGBUILD is a Bash script containing the build information required by Arch Linux packages.

This file can be used as a template to create your own `PKGBUILD`:
```
/usr/share/pacman/PKGBUILD.proto
```

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

Example:
```
makedepends=('libpulse')
```

#### depends

> depends (array) \
An array of packages this package depends on to run.\
Entries in this list should be surrounded with single quotes and contain at \
least the package name.\
Entries can also include a version requirement of the form `name<>version`, where `<>` is one of five \
comparisons: `>=` (greater than or equal to), `<=` (less than or equal to), \
`=` (equal to), `>` (greater than), or `<` (less than).

> If the dependency name appears to be a library (ends with .so), \
makepkg will try to find a binary that depends on the library in the \
built package and append the version needed by the binary.\
Appending the version yourself disables automatic detection.

> Additional architecture-specific depends can be added by appending an underscore and the architecture name e.g., depends_x86_64=().

If you just exeute `makepkg` you get this error:
```
==> ERROR: Could not resolve all dependencies.
```

You need to:
```
makepkg -s
```
> -s -> Install missing dependencies using pacman.

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
