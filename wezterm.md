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

#### build from source

```
git clone https://github.com/wezterm/wezterm
```

```
cargo build
```
This takes about 20 minutes and really slows down your pc.

## configuration

You can create the config file here:\
`${HOME}/.config/wezterm/wezterm.lua`

#### start and end block

You need a start and end block in your config file:
```
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.font_size = 10
config.font = wezterm.font('DejaVueSansMono')

-- Finally, return the configuration to wezterm:
return config
```

#### different font

```
config.font = wezterm.font('DejaVueSansMono')
```
But this font is not a real mono font and destroys the terminal.

Better use `FreeMono`:
```
config.font = wezterm.font('FreeMono')
```

#### font size

```
config.font_size = 14
```

## usage

#### default keybindings

https://wezterm.org/config/default-keys.html

new tab: ctrl + shift + t OR super + t \
close current tab: ctrl + shift + w OR super + w \

#### TODO: copy mode

https://wezterm.org/copymode.html

## troubleshooting

#### foreground highlighting does not work

By default I could not see a difference between the bold and normal text:
```
printf "foo\e[1mfoo\e[0mfoo\n"
```

This is a font issue!

With `FreeMono` I can see a difference.
```
config.font = wezterm.font('FreeMono')
```

You can also set up `font_rules` and define fonts for different intensities.
