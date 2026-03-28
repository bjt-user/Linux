## general info

```
git clone https://github.com/mpv-player/mpv.git
```

#### TODO: building

Edit `meson.options`.

Disable pipewire by changing the line to this:
```
option('pipewire', type: 'feature', value: 'disabled', description: 'PipeWire audio output')
```

```
meson setup builddir
```

```
meson compile -C builddir
```

```
meson install -C builddir
```

But now only sound works, no video...

And how to uninstall mpv now?

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
