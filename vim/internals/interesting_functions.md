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
