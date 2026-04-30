## general info

> list USB devices

#### installation

```
sudo pacman -S lsbutils
```

## usage

#### show details about device

Use the value after `ID` from the output of `lsusb`.

```
lsusb -d 058f:9540 -v
```
