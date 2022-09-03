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
