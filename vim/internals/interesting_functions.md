#### print character to cursor position (out_char() and out_flush())

This will print f (character 102) to the cursor position:
```
(gdb) call out_char(102)
(gdb) call out_flush()
```

#### do_more_prompt()

```
call do_more_prompt(0)
```
puts this in the status line:
```
-- More --
```

This
```
(gdb) call (int)do_more_prompt(1)
```
will output:
```
-- More -- SPACE/d/j: screen/page/line down, b/u/k: up, q: quit
```

#### echo_string()

The function `echo_string` is called when you do an `:echo 'foo'` inside vim.\
But it is seems to be deeper in the call stack.

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

#### out_flush()

Writes the var `out_buf` to the screen.

`out_buf` is defined in `term.c`:
```
2759 static char_u           out_buf[OUT_SIZE + 1];
```

#### term_color()

Is called very often.

From `term.c`:
```
3177     static void
3178 term_color(char_u *s, int n)
```

What does it do?

#### togoto()

Seems to return the first argument:
```
(gdb) call (char*)tgoto("foobar", 0, 0)
$34 = 0x63976ef122e0 "foobar"
```

#### wait_return()

This plays a big role in the "hit enter" prompt, but it does not \
directly print the "hit enter" message.

#### msg()

This will print a message in the status line, similar to `:echo "foo"`:
```
(gdb) call msg("foo")
```

An `:echo 'foo'` insdie `vim` does not call this function at all.

Does not render ansi escape sequences.

#### functions to try

```
void ins_char(int);
```

```
static int do_more_prompt(int);
```

```
int pagescroll(int, long, int);
```

```
static int peekchr(void);
```

```
void out_char(unsigned int);
```
```
void out_flush(void);
```

typval.c:
```
typval_T *alloc_string_tv(char_u *);
```
=> probably initializing a vimscript string var?

```
void wait_return(int redraw)
```
=> seems to do nothing, when executed via gdb \
=> but is important for the "hit enter" prompt
