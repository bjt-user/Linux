## how to get rid of the piezo buzzer

https://wiki.archlinux.org/title/PC_speaker

having a `~/.inputrc` with
```
set bell-style none
```
seems to help for bash completion in the pure linux terminal, but not for vim when you hit the end of file.

#### unloading kernel modules

put the folloing lines into `/etc/modprobe.d/nobeep.conf`
```
blacklist pcspkr
blacklist snd_pcsp
```

then do
```
sudo rmmod pcspkr
sudo rmmod snd_pcsp
```

=> that seemed to work globally!
