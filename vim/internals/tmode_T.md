## general info

In `termdefs.h`:
```
typedef enum {
    TMODE_COOK,     // terminal mode for external cmds and Ex mode
    TMODE_SLEEP,    // terminal mode for sleeping (cooked but no echo)
    TMODE_RAW,      // terminal mode for Normal and Insert mode
    TMODE_UNKNOWN   // after executing a shell
} tmode_T;
```

## TODO: how to set the terminal mode?

Maybe with this from `term.c`?
```
    void
settmode(tmode_T tmode)
```

=> that function seems to drastically change the behavior of vim

## determine current tmode

```
printf("cur_tmode: %d\n", cur_tmode);
```
