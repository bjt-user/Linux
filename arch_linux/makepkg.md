## general info

https://wiki.archlinux.org/title/Makepkg

> makepkg is a script to automate the building of packages.

(https://gitlab.archlinux.org/pacman/pacman/blob/master/scripts/makepkg.sh.in)

https://wiki.archlinux.org/title/Creating_packages

https://wiki.archlinux.org/title/PKGBUILD

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
