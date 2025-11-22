## general info

A typedef of structure `typval_S`.

Holds data for vim script variables.

## usage

#### get string value

If your `typval_T` variable is called `rettv`:
```
char_u* str = unescape_esc(rettv.vval.v_string);
```
