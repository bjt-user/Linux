## general info

```
man ufed
```

Gentoo USE flag editor.

## usage

#### changing a use flag

(You need to use `sudo` to not be in readonly mode):
```
sudo ufed
```

Type in the name of the use flag to search for it.

Arrow keys to navigate.

<Space> to enable/disable.

<Enter> to save and quit.

Now the USE flag will be added to `/etc/portage/make.conf`.
