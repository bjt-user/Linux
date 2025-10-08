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

#### msg_attr_keep()

Since `msg()` internally calls `msg_attr_keep` you can use that directly in `main_loop`:
```
msg_attr_keep("This is msg_attr_keep", 0, 0);
```
And the string will be printed in the status bar.
