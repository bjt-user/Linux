## general info

Upstream: https://github.com/wezterm/wezterm

https://wezterm.org

Written in Rust.

#### installation

```
sudo pacman -S wezterm
```

#### features

- tabs
- copy on selection is the default

## configuration

You can create the config file here:\
`${HOME}/.config/wezterm/wezterm.lua`

#### TODO: font size

## usage

#### default keybindings

https://wezterm.org/config/default-keys.html

new tab: ctrl + shift + t OR super + t \
close current tab: ctrl + shift + w OR super + w \

#### TODO: copy mode

https://wezterm.org/copymode.html

## troubleshooting

#### TODO: foreground highlighting does not work

By default this will not print in bold or highlighted:
```
printf "\e[1mfoo\e[0m\n"
```
