## general info

#### installation

```
sudo pacman -S thunar gvfs
```

You need `gvfs` (gnome virutal file system) to automatically mount USB devices!

## usage

#### open in terminal

Edit -> Configure custom actions

Doubleclick "open terminal here"

Command: "/usr/bin/terminator"

Then it should open `terminator` when you click "open terminal here".

#### open with vim

Edit -> Configure custom actions

create a new action "open in vim"

command: `/usr/bin/terminator -e "/usr/bin/vim %F"`

Appearance conditions: text files

But the default application stuff will NOT work.

And you will have a new action on text files called "open in vim".\
The case sensitive "Open In Vim" option will not work.
