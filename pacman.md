```
pacman -S packagename
```
to install a package

```
pacman -Q | less
```
shows installed packages

```
pacman -Qe
```
shows explicitly installed packages


```
pacman -Qi openssh
```
shows information about a package
```
pacman -Ss openssh
```
searches for packages that contain the name "openssh" either in their name or description


uninstall a package:
```
sudo pacman -R inetutils
```

You can also use
```
pacman -Su
```
 to upgrade all packages that are out-of-date.

#### packages

How to install the `hostname` command with pacman?

The following package contains a `hostname` command, but this is not the same program as in `Debian`.\
This program is written by `Debarshi Ray`:
```
sudo pacman -S inetutils
```

Looks like I have to get my IP from the `ip address` command in the future.
