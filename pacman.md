https://wiki.archlinux.org/title/Pacman

#### install a package
```
sudo pacman -S packagename
```


#### show installed packages
```
pacman -Q | less
```
or
```
pacman -Q packagename
```
to list a specific package (the argument must exactly match the installed package name)

```
pacman -Qe
```
shows explicitly installed packages

***

#### show information about a package

this is for packages that are not installed yet:
```
pacman -Si postgresql
```

```
pacman -Qi openssh
```
shows information about an **installed** package\
only works if the package is installed...
***

#### search for packages
```
pacman -Ss openssh
```
searches for packages that contain the name "openssh" either in their name or description

#### uninstall packages

uninstall a package:
```
sudo pacman -R inetutils
```

But this doesnt seem to remove dependencies.

#### uninstall package and remove dependencies

```
sudo pacman -Rcns <package>
```

`-R`: remove

`-c`: cascade (I always check what will get removed)

`-n`: no save (when I remove something I really want it gone)

`-s`: remove dependencies ( mostly for cleanup)

If I see potential problems with -c

I cancel and do

```
sudo pacman -Runs <package>
```

-u: avoid removing packages if other packages depend on it.

And I use btrfs and snapper creating snapshots after every install or remove in case I mess something u


#### upgrade all packages
You can also use
```
pacman -Su
```
 to upgrade all packages that are out-of-date.

(but better combine this with the `-y` option which )
```
pacman -Syu
```
Update package list and upgrade all packages afterwards.


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

## troubleshooting

#### gpg keys

Sometimes there are problems getting the gpg keys.
```
man 5 pacman.conf
```
The SigLevel directive is valid in both the options and repository sections.\
If used in options, it sets a default value for any repository that does not provide the setting.

•   If set to Never, no signature checking will take place.
•   If set to Optional , signatures will be checked when present, but unsigned databases and packages will also be accepted.
•   If set to Required, signatures will be required on all packages and databases.

```
$ cat /etc/pacman.conf | grep -ni "sig"
43:SigLevel    = Never
44:LocalFileSigLevel = Never
45:RemoteFileSigLevel = Never
```

Then a `sudo pacman -Syu` will work again.

#### TODO: download source code of a package

https://stackoverflow.com/questions/4468447/how-to-download-source-code-with-pacman-on-arch-linux
