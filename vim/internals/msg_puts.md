## general info

```
/*
 * Output a string to the screen at position msg_row, msg_col.
 * Update msg_row and msg_col for the next message.
 */
    void
msg_puts(char *s)
{
    msg_puts_attr(s, 0);
}
```

## behavior (when used in ex command)

This will just print `foobar` to the "cmdline":
```
msg_puts("foobar");
```

This will actually print "red" in red color:
```
msg_puts("\e[31mred\e[0m");
```

This as well:
```
msg_puts("\033[31mred\033[0m");
```

And this also:
```
msg_puts("\x1b[31mred\x1b[0m");
```

New lines will be printed as new lines:
```
msg_puts("foo\nbar\n");
```
will print
```
foo
bar
```
