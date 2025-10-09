#### print character to cursor position

This will print f (character 102) to the cursor position:
```
(gdb) call out_char(102)
(gdb) call out_flush()
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
