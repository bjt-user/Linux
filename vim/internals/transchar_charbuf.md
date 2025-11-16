#### general info

File level variable defined in `charset.c`:
```
static char_u   transchar_charbuf[7];
```

At some point after executing this command:
```
:echo "\e[31mred\e"
```
the variable `transchar_charbuf` contains this value `^[`.

The question is: When does `transchar_charbuf` receive this value? \
=> conditional breakpoint \
=> but you need to know where to set the breakpoint

This didnt work:
```
b echo_one if transchar_charbuf == "^["
```
This did also not work:
```
b msg_outtrans_len_attr if transchar_charbuf == "^["
```

#### when the value changes

Inside `transchar_buf` a new character seems to get loaded into the \
variable at this point if it is a printable character:
```
549		// printable character
550		transchar_charbuf[i] = c;
```

If it is not a printable character the function `transchar_nonprint` \
changes the value of this variable in some situations to `^[`:
```
553	    else
554		transchar_nonprint(buf, transchar_charbuf + i, c);
```
