list open files

```
lsof -p [pid]
```

or

```
lsof -p $(pgrep pulse)
```
to show files that are opened by pulseaudio

***

#### lsof on a directory

lsof on the current dir:
```
/dev/snd $ lsof +d .
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
pipewire  6321   bf  mem    CHR 116,11           843 ./pcmC2D0p
pipewire  6321   bf   49u   CHR  116,1      0t0  501 ./seq
pipewire  6321   bf   50u   CHR  116,1      0t0  501 ./seq
pipewire  6321   bf   59u   CHR 116,11      0t0  843 ./pcmC2D0p
wireplumb 6322   bf   31u   CHR 116,10      0t0  750 ./controlC1
wireplumb 6322   bf   32u   CHR 116,13      0t0  845 ./controlC2
wireplumb 6322   bf   33u   CHR  116,6      0t0  713 ./controlC0
bash      7919   bf  cwd    DIR    0,5      360  499 .
lsof      9251   bf  cwd    DIR    0,5      360  499 .
lsof      9252   bf  cwd    DIR    0,5      360  499 .
```
