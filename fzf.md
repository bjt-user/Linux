#### fedora install and config

```
sudo dnf install fzf
```

put this in your `~/.bashrc`:
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
