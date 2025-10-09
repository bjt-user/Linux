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
