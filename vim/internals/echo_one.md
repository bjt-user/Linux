#### general info

```
File eval.c:
7643:	void echo_one(typval_T *, int, int *, int *);
```

It makes repeated calls to `msg_outtrans_len_attr` in a for loop.

#### triggered by

This will trigger the function:
```
:echo "foo"
```

#### for loop

The for loop iterates through the string to be printed under the status bar.

The string is in variable `p`.\
Every iteration removes the first character of `p` until the string is empty.

#### test :echo "foo"

Given this command:
```
:echo "foo"
```

`echo_one` will not print directly to the screen.

"foo" is printed after
```
msg_end();
```
in `ex_echo()` is called.

Maybe this is different for longer strings or strings with a newline character.

#### test :echo "foo\n"

After
```
:echo "foo\n"
```

"foo" will NOT be printed after `msg_end()`.\
It will be printed much later in `do_cmdline` after:
```
wait_return(FALSE);
```
