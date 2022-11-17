https://wiki.archlinux.org/title/Pacman

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
shows information about a package\
only works if the package is installed...

this is for packages that are not installed yet:
```
pacman -Si postgresql
```

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

#### repositories

repositories can be configured in `/etc/pacman.conf`

I tried it like this:
```
[docker-ce]
SigLevel = Optional TrustAll
Server = https://download.docker.com/linux/static/stable/x86_64/
```
And it failed:
```
warning: database file for 'docker-ce' does not exist (use '-Sy' to download)
```

You could try the `-y` option:
```
-y, --refresh
Download a fresh copy of the master package database from the server(s) defined in pacman.conf(5). This should typically be used each time you use
--sysupgrade or -u. Passing two --refresh or -y flags will force a refresh of all package databases, even if they appear to be up-to-date.
```

```
$ sudo pacman -Sy
error: failed retrieving file 'docker-ce.db' from download.docker.com : The requested URL returned error: 404
```

=> the link is to binary packages of docker not to a repo

after deleting that false repo I did
```
sudo pacman -Sy
```
again and this updates and shows all repos

#### packages

How to install the `hostname` command with pacman?

The following package contains a `hostname` command, but this is not the same program as in `Debian`.\
This program is written by `Debarshi Ray`:
```
sudo pacman -S inetutils
```

Looks like I have to get my IP from the `ip address` command in the future.

***
#### files

To retrieve a list of the files installed by a package:

```
pacman -Ql package_name
```

To retrieve a list of the files installed by a "remote package":\
(whatever that is...)
```
pacman -Fl package_name
```

search for a specific file/command you want
```
pacman -F hostname
```
=> this shows me that I can get the hostname command with the `inetutils` package
