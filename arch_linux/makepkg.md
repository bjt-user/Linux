## general info

https://wiki.archlinux.org/title/Makepkg

> makepkg is a script to automate the building of packages.

(https://gitlab.archlinux.org/pacman/pacman/blob/master/scripts/makepkg.sh.in)

https://wiki.archlinux.org/title/Creating_packages

https://wiki.archlinux.org/title/PKGBUILD

#### dependencies

You will need tools from this package:
```
sudo pacman -S base-devel
```
Otherwise you might get errors like this:
```
==> ERROR: Cannot find the debugedit binary required for including source files in debug packages.
```

## usage

#### run without installing pkg

Inside dir with `PKGBUILD` run:
```
makepkg
```

#### cleanup after building

This will cleanup the "src" and "pkg" dirs after building:
```
makepkg -c
```

## examples

#### minimal PKGBUILD

Make a new dir with a file called `PKGBUILD` that has this content:
```
pkgname=helloworld
pkgver=0.0.1
pkgrel=1
arch=('x86_64')

package() {
	printf "hello world"
}
```

Now run `makepkg`.

## troubleshooting

#### debug package?

What is the "debug" package that `makepkg` wants to install alongside \
my package?
