apt is the package manager used on Debian based systems like Debian, Ubuntu, Raspberry OS, Linux Mint

***
#### where files are installed

To find out where the files of a package are actually installed you have to install `apt-file`.
```
sudo apt install apt-file
sudo apt-file update
```

To show where all the files of the package `fzf` are installed:
```
apt-file list fzf
```

You can also try this after the package is already installed:
```
dpkg -L fzf
```

search for files:
```
$ sudo apt-file search alarm-clock-elapsed
sound-theme-freedesktop: /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
```

***

#### show the source/repo of a package

To see where for example the git repo of a software is:
```
sudo apt-get source fritzing
```
Note that this does not show the apt repo of that package.


***

#### apt repos

This directory contains the repositories the user added to apt:
```
/etc/apt/sources.list.d
```

https://wiki.debian.org/SourcesList

***

#### updating packages

usually you do `apt update` and `apt upgrade`.\
But sometimes packages are held back (this happened when going from `Debian Bullseye` to `Debian Sid`).\
Then you can do:
```
sudo apt dist-upgrade
```
***
