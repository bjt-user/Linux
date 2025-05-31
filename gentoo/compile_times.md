#### recompiling gcc

```
time sudo emerge -va --newuse -e gcc
```

took 631m46.235s

Roughly 10.5 hours.

With 4 cpu cores and these use flags:
```
USE="dist-kernel -elasticsearch -emacs -gnome -gnome-keyring -kde -multilib
     -nis -nls -wayland -zsh-completion"
```

Longer than compiling the whole system for the first time.
