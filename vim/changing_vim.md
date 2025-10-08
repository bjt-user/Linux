#### msg()

Put this line
```
msg("foobar\n");
```
in function `main_loop()`.

Before these lines:
```
clear_oparg(&oa);
    while (!cmdwin || cmdwin_result == 0)
    {
```

Then
```
make -j6
```

```
./vim
```

And you will see the message "foobar^@" on the screen.
