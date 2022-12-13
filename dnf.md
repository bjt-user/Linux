Paketmanager für `Red Hat` Distros. (z.B. `fedora`, `oracle linux`, `centos`, `red hat enterprise linux`)

```
sudo dnf repolist
```
will show all repositories that `dnf` gets packages from.

Repositories can be configured in
```
/etc/yum.repos.d
```
#### where files are installed

https://unix.stackexchange.com/a/715986/438538

before installing:
```
dnf repoquery -l fzf
```

after installing:
```
rpm -ql fzf
```

***
#### repositories
`epel` - extra packages for enterprise linux

#### add a repository

```
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```
(version 9 is available and I used that, but the system uses 8 because the docker container was oracle linux 8)\
this did not work on `Fedora 36` machine

to see where those files have been installed:
```
rpm -ql epel-release
```

to verify that the repository is enabled:
```
dnf repolist -v
```

But I get an error installing an `epel` package:
```
Curl error (37): Couldn't read a file:// file for file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 [Couldn't open file /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8]
```

```
rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
```

And now it works! I can install `epel` packages.

The problem might have been that I installed `epel` version 9 on `oracle linux` 8.\
Maybe you don't have to import the gpg key when you pick the right version.\
Yes there is a `RPM-GPG-KEY-EPEL-9` in `/etc/pki/rpm-gpg`.

***

#### search for packages and files

with
```
dnf provides filename
```
you can search with a filename to see in which package the file is in.

For example a program told me I need `pdflatex` and there was no `pdflatex` package available.

```
$ pandoc -f markdown -t pdf mymarkdown.md -o mymarkdown.pdf
pdflatex not found. Please select a different --pdf-engine or install pdflatex

$ dnf provides pdflatex
Last metadata expiration check: 0:47:54 ago on Thu 27 Oct 2022 10:57:38 AM CEST.
texlive-latex-9:20210325-47.fc36.noarch : A TeX macro package that defines LaTeX
Repo        : fedora
Matched from:
Filename    : /usr/bin/pdflatex
```

So `pdflatex` is a binary file that is in the package `texlive-latex-9:20210325-47.fc36.noarch`.

***

#### dnf and rpm

https://stackoverflow.com/a/48609783/13253079



> These tools work together. DNF handles dependency solving, finding files on the network, repository management, and so on. RPM handles the lower-level part of actually putting the files on your system.

> In most cases as an end user, DNF is all you need to interact with. You might use RPM commands for lower-level troubleshooting, but in most cases DNF provides all the functionality in a more friendly manner.

> Note that you may also see "Yum". DNF is the successor to that tool, which essentially did the same thing. In recent versions of the Fedora OS, yum and dnf are exactly interchangeable.


#### search or list packages without syncing

```
-C, --cacheonly
Run entirely from system cache, don't update the cache and use it even in case it is expired.

DNF uses a separate cache for each user under which it executes. The cache for the root user is called the system cache. This switch allows a regular  user  read-only  access  to  the  system cache, which usually is more fresh than the user's and thus he does not have to wait for metadata sync.
```

You might set aliases like this:
```
alias dnf search=dnf search -C
```

The same for `dnf list` -> `dnf list -C "foo"`
