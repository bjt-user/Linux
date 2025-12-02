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

msg_puts -> msg_puts_attr(s, 0) -> msg_puts_attr_len(s, -1, attr) \
-> msg_puts_display

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
msg_puts("\033[38;5;246m─────┬──────────────────────────────────────────────────────────────────────────\033[0m\n     \033[38;5;246m│ \033[0mF    ile: \033[1m/etc/os-release\033[0m\n\033[38;5;246m─────┼──────────────────────────────────────────────────────────────────────────\033[0m\n\    033[38;5;246m   1\033[0m \033[38;5;246m│\033[0m \033[38;5;231mNAME\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mArch Lin    ux\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;246m   2\033[0m \033[38;5;246m│\033[0m \033[38;5;231mPRETTY_NAME\033[0m\033[38;5;203m=\033[0m\03    3[38;5;231m\"\033[0m\033[38;5;186mArch Linux\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;246m   3\033[0m \033[38;5;246m│\033[0m \033[38;5;231mI    D\033[0m\033[38;5;203m=\033[0m\033[38;5;186march\033[0m\n\033[38;5;246m   4\033[0m \033[38;5;246m│\033[0m \033[38;5;231mBUILD_ID\033[0m\033[    38;5;203m=\033[0m\033[38;5;186mrolling\033[0m\n\033[38;5;246m   5\033[0m \033[38;5;246m│\033[0m \033[38;5;231mVERSION_ID\033[0m\033[38;5;203    m=\033[0m\033[38;5;186mTEMPLATE_VERSION_ID\033[0m\n\033[38;5;246m   6\033[0m \033[38;5;246m│\033[0m \033[38;5;231mANSI_COLOR\033[0m\033[38;5    ;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186m38;2;23;147;209\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;246m   7\033[0m \033[38;5;246m│\0    33[0m \033[38;5;231mHOME_URL\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mhttps://archlinux.org/\033[0m\033[38;5;231m\"\    033[0m\n\033[38;5;246m   8\033[0m \033[38;5;246m│\033[0m \033[38;5;231mDOCUMENTATION_URL\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m    \033[38;5;186mhttps://wiki.archlinux.org/\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;246m   9\033[0m \033[38;5;246m│\033[0m \033[38;5;231mSUPP    ORT_URL\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mhttps://bbs.archlinux.org/\033[0m\033[38;5;231m\"\033[0m\n\033[38;5    ;246m  10\033[0m \033[38;5;246m│\033[0m \033[38;5;231mBUG_REPORT_URL\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mhttps:    //bugs.archlinux.org/\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;246m  11\033[0m \033[38;5;246m│\033[0m \033[38;5;231mPRIVACY_POLICY_URL\033[0    m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mhttps://terms.archlinux.org/docs/privacy-policy/\033[0m\033[38;5;231m\"\033[0m\n    \033[38;5;246m  12\033[0m \033[38;5;246m│\033[0m \033[38;5;231mLOGO\033[0m\033[38;5;203m=\033[0m\033[38;5;186marchlinux-logo\033[0m\n\033[38    ;5;246m─────┴──────────────────────────────────────────────────────────────────────────\033[0m\n")
```
