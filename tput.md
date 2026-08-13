## general info

Part of the `ncurses` package in Arch:
```
$ sudo pacman -F tput
core/ncurses 6.6-1 [installed: 6.6-2]
    usr/bin/tput
```

```
man tput
```

> tput - initialize a terminal, exercise its capabilities, or query terminfo database

## usage

#### get capability

```
$ tput colors
256
```

#### move cursor to "home"

```
tput home
```

> Move the cursor to row 0, column 0: the upper left corner of the screen, usually known as the “home” cursor position.

#### boolean capabilities

This means that the `am` capability is set (is true):
```
$ tput am
$ echo $?
0
```
