## general info

The function `echo_string` is called when you do an `:echo 'foo'` inside vim.

In `eval.c`:
```
/*
* Return a string with the string representation of a variable.
* If the memory is allocated "tofree" is set to it, otherwise NULL.
* "numbuf" is used for a number.
* Does not put quotes around strings, as ":echo" displays values.
* When "copyID" is not zero replace recursive lists and dicts with "...".
* May return NULL.
*/
    char_u
echo_string(
    typval_T    *tv,
    char_u      **tofree,
    char_u      *numbuf,
    int         copyID)
```
