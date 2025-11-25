## general info

Function in `ex_docmd.c`.

```
/*
 * do_cmdline(): execute one Ex command line
 *
 * 1. Execute "cmdline" when it is not NULL.
 *    If "cmdline" is NULL, or more lines are needed, fgetline() is used.
 * 2. Split up in parts separated with '|'.
 *
 * This function can be called recursively!
 *
 * flags:
 * DOCMD_VERBOSE  - The command will be included in the error message.
 * DOCMD_NOWAIT   - Don't call wait_return() and friends.
 * DOCMD_REPEAT   - Repeat execution until fgetline() returns NULL.
 * DOCMD_KEYTYPED - Don't reset KeyTyped.
 * DOCMD_EXCRESET - Reset the exception environment (used for debugging).
 * DOCMD_KEEPLINE - Store first typed line (for repeating with ".").
 *
 * return FAIL if cmdline could not be executed, OK otherwise
 */
    int
do_cmdline(
    char_u      *cmdline,
    char_u      *(*fgetline)(int, void *, int, getline_opt_T),
    void        *cookie,                // argument for fgetline()
    int         flags)
```

It gets called when you hit `:` in normal mode.

It calls `do_one_cmd` with the variable `cmdline_copy`.\
And in `cmdline_copy` is the command as a string.

#### basic call graph

do_cmdline -> do_one_cmd

```
1042         next_cmdline = do_one_cmd(&cmdline_copy, flags,
1043 #ifdef FEAT_EVAL
1044                                 &cstack,
1045 #endif
1046                                 cmd_getline, cmd_cookie);
```

#### cmdline_copy

It gets assigned a string value in this line:
```
968		cmdline_copy = next_cmdline;
```

#### next_cmdline

Seems to get assigned here:
```
925             if (fgetline == NULL || (next_cmdline = fgetline(':', cookie,
```

#### function pointer "fgetline"

When hitting a `:` there is the function `getexline` from `ex_getln.c` behind \
the function pointer:
```
(gdb) p fgetline
$1 = (char_u *(*)(int, void *, int,
    getline_opt_T)) 0x561cd542d70a <getexline>
```
