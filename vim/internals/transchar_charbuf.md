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
=> conditional breakpoint
