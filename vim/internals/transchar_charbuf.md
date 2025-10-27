#### general info

File level variable defined in `charset.c`:
```
static char_u   transchar_charbuf[7];
```

At some pointer after executing this command:
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
