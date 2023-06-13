https://wiki.archlinux.org/title/SANE

plug in your scanner and turn it on
```
sudo sane-find-scanner
```

but
```
scanimage -L
```
says no device found...

https://developers.hp.com/hp-linux-imaging-and-printing/

=> it gives you a shell script that you have to execute and it seems to only work for specific distros\
=> maybe install a listed distro in a VM
