#### fedora install and config

```
sudo dnf install fzf
```

to enable <kbd>ctrl + r</kbd> for fzf bash history search put this in your `~/.bashrc`:
```
# fzf - make ctrl + r work with fzf
source /usr/share/fzf/shell/key-bindings.bash
```

***

for other distros try going into `/` and search with fzf for files that contain the pattern `fzf`:
```
cd /
fzf
# now type `fzf` and search for a key-bindings file
```

#### multiselect

```
ls | fzf -m
```
Select with <kbd>tab</kbd> \
deselect with <kbd>shift</kbd> + <kbd>tab</kbd>

It is easier to select if you use `--reverse`. Then you can just hit tab repeatedly:
```
fzf -m --reverse
```
