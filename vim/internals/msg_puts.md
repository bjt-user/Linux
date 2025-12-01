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

## basic call graph

msg_puts -> msg_puts_attr(s, 0) -> msg_puts_attr_len(s, -1, attr)

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

It even prints unicode characters.\
This will print a checkmark at cmdline:
```
msg_puts("\u2713\n");
```
Even two of these in a row will work.

Maybe some some specific characters break it?\
Check what the first characters of `bat` output are.\
=> it could be `"\u2500"` => that doesnt break `msg_puts`

#### assumptions

Long escape sequences cannot be properly displayed because msg_row and msg_col \
are not updated correctly.

## troubleshooting

#### bat output

The output of this string will be misformatted:
```
msg_puts("\033[38m\u2500\u2500");
```
The two unicode chars will be separated by whitespace.

The output is the same with a literal unicode code point copy and pasted from \
somewhere else.

But different symbols do not behave the same way.\
Two check marks will not be divided by whitespace. (`\u2713`)

And without the ansi escape sequence the two characters will also \
not be separated by whitespace.
