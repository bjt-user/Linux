```
man terminator_config
```

#### color schemes

https://github.com/EliverLara/terminator-themes/blob/master/themes.md

choose one, then copy the content of the equivalent file here:\
https://github.com/EliverLara/terminator-themes/tree/master/schemes \
into your `~/.config/terminator/config`

But don't paste the header in, too.\
Paste it into your current profile and comment out lines you already had.


Good color schemes are:
- Onehalfdark (but delete the `background_color` line if you use transparent terminal background)

Bad color schemes:
- Afterglow
- batman

#### standard keybindings

<kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>t</kbd> - open new tab\
<kbd>ctrl</kbd> + <kbd>PageDown/PageUp</kbd> - switch to next tab

#### custom keybindings

changing keybindings with right click did not work permanently.

```
$ cat ~/.config/terminator/config
...
[keybindings]
  full_screen = <Ctrl><Shift>F11
  next_tab = <Ctrl>Tab
  close_term = <Ctrl>w
...
```


#### example config file

`~/.config/terminator/config`

this should work quite well:
```
[global_config]
  focus = system
[keybindings]
  full_screen = <Ctrl><Shift>F11
  next_tab = <Ctrl>Tab
  close_term = <Ctrl>w
[profiles]
  [[default]]
    background_darkness = 0.8
    background_type = transparent
    cursor_blink = False
    cursor_color = "#FFFFFF"
    font = Inconsolata Medium 14
    foreground_color = "#ffffff"
    show_titlebar = False
    custom_command = 'echo \"foo#bar\"'
    use_system_font = False
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
      size = 1980, 1080
    [[[child]]]
      type = Terminal
      parent = window0
[plugins]
```
