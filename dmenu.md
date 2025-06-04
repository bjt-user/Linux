#### dmenu_run

The executable `dmenu_run` will use your `$PATH` for selecting applications.

#### usr/bin/i3-dmenu-desktop

If you install the `i3-wm` package on Arch there is also the \
`i3-dmenu-desktop` executable that you can use.

```
man i3-dmenu-desktop
```

It searches `.desktop` files.

> The .desktop files are searched in $XDG_DATA_HOME/applications (by default $HOME/.local/share/applications)\
and in the "applications" subdirectory of each entry of $XDG_DATA_DIRS (by default /usr/local/share/:/usr/share/).

`/usr/share/applications` contained a lot of `.desktop` files.

It uses the `Name` entry of those `.desktop` files.
