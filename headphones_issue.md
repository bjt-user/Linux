[seems to be a common bug within pulseaudio or alsa that cannot be fixed]
Problem: after every reboot I have to replug headphones

```
sudo vim /usr/share/pulseaudio/alsa-mixer/paths/analog-output-lineout.conf
```

[Element Headphone]
switch = off (--->Change off to on)
volume = off

SAVE FILE AND restart pulseaudio:


sudo vim /usr/share/pulseaudio/alsa-mixer/paths/analog-output-lineout.conf

[Element Headphone]
switch = off (--->Change off to on)
volume = off

SAVE FILE AND restart pulseaudio:

```
$ pulseaudio -k
$ pulseaudio --start
```

=> did not solve the problem

***

## FAILS:

Ich adde folgendes in die Datei:

[Jack Headphone]

state.plugged = yes

state.unplugged = unknown

=> bringt nichts


adding this to .bashrc did not do anything:
```
restore_alsa() {
 while [ -z "$(pidof pulseaudio)" ]; do
  sleep 0.5
 done
 alsactl -f /var/lib/alsa/asound.state restore 
}
```
restore_alsa &
