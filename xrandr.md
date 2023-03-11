```
xrandr --listactivemonitors
```

disable a monitor:
```
xrandr --output eDP-1 --off
```

enable a monitor
```
xrandr --output eDP-1 --auto
```

#### change resolution

```
xrandr --fb 1920x1080 --output eDP-1
```

***

#### mirror laptop screen to external monitor

connect the hdmi cable

run this command:
``` 
xrandr --auto
```

(now the resolution is fucked on both monitors)

then run this command:
```
xrandr --output HDMI-2 --mode 1920x1080
```
then it worked\
not sure why this worked...

***
