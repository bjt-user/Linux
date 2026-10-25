## install kde plasma

First install xorg. See [xorg](xorg.md).

Use the `plasma-meta` for a minimal installation.\
(The `plasma` group would install a lot of applications.)
```
sudo pacman -S plasma-meta
```
Always hit enter and use the first option.

You should at least install a terminal.\
Otherwise you might be softlocked.\
The default kde terminal is `konsole`.\
I will use `wezterm` for now.

Instal `sddm`:
```
sudo pacman -S sddm
```

```
sudo systemctl enable --now sddm
```

And now you should be able to login.

## plasma shortcuts

super key + pgup => maximize window

## TODO: plasma audio

`plasma` seems to use `pipewire` by default and when you try to install \
`pulseaudio` it will fail because "removing pipewire-pulse breaks \
dependency 'pipewire-pulse' required by pulse-native-provider".
