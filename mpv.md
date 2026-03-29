## general info

```
git clone https://github.com/mpv-player/mpv.git
```

#### building

Dependencies:
```
sudo pacman -S libxpresent
```

Edit `meson.options`.

Disable pipewire by changing the line to this:
```
option('pipewire', type: 'feature', value: 'disabled', description: 'PipeWire audio output')
```

Also make sure `x11` is enabled and `wayland` is disabled.

```
-option('wayland', type: 'feature', value: 'auto', description: 'Wayland')
-option('x11', type: 'feature', value: 'auto', description: 'X11')
+option('wayland', type: 'feature', value: 'disabled', description: 'Wayland')
+option('x11', type: 'feature', value: 'enabled', description: 'X11')
```

```
meson setup builddir
```

```
meson compile -C builddir
```

Then inside `builddir` there is the executable.

To install it just put the executable into `/usr/local/bin`.

#### TODO: uninstall after meson install

Using `meson install -C builddir` is a problem as you cant cleanly uninstall...

```
rm -fv /usr/local/bin/mpv
rm -rfv /usr/share/doc/mpv
rm -fv /usr/share/metainfo/mpv.metainfo.xml
rm -fv /usr/share/applications/mpv.desktop
rm -fv /usr/local/share/bash-completion/completions/mpv
...
```

Maybe just do this:
```
find /usr/local -iname "*mpv*" -type f -delete
```

## configuration

`.config/mpv/mpv.conf`

set default volume to zero:
```
volume=0
```

## usage

#### use a playlist

Play a list of file randomly:
```
mpv --playlist=mpv_playlist.txt --shuffle
```
