## general info

Function in `nnn.c`.

```
static bool browse(char *ipath, int pkey)
```

It seems to startup the tui.

#### TODO: after which function call is the tui up?

At the `before` label the tui is not up yet.

It seems to be this line:
```
8593         sel = nextsel(presel);
```
