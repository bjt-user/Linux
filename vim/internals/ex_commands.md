## how to add a new ex command?

#### cmdidxs

From `ex_cmds.h`:
```
/*
 * When adding an Ex command:
 * 1. Add an entry in the table below.  Keep it sorted on the shortest
 *    version of the command name that works.  If it doesn't start with a
 *    lower case letter, add it at the end.
 * 2. Run "make cmdidxs" to re-generate ex_cmdidxs.h.
 * 3. Add a "case: CMD_xxx" in the big switch in ex_docmd.c.
 * 4. Add an entry in the index for Ex commands at ":help ex-cmd-index".
 * 5. Add documentation in ../doc/xxx.txt.  Add a tag for both the short and
 *    long name of the command.
 */
```

```
make cmdidxs
```
will change the file `ex_cmdidxs.h`

#### parameters

All commands seem to have the same parameter `exarg_T *eap`.\
Even the `:x` command which usually doesn't need an argument:
```
ex_docmd.c:ex_exit(exarg_T *eap)
```

#### example hello world

Put a new function in some .c file.\
It probably does not matter where.

In `eval.c` worked:
```
    void
ex_echohello(exarg_T *eap)
{
    mch_write("hello world", 11);
}
```
(The parameter needs to be the same, cannot be void.)

In `ex_cmds.h` add this:
```
+EXCMD(CMD_echohello,   "echohello",    ex_echohello,
+       EX_EXTRA|EX_TRLBAR|EX_SBOXOK|EX_CMDWIN|EX_LOCK_OK,
+       ADDR_NONE),
```

In `ex_docmd.c` add this:
```
+# define ex_echohello          ex_ni
```
(probably not needed if you use an existing define)

Then in `proto/eval.pro` add the prototype:
```
+void ex_echohello(exarg_T *eap);
```
(This depends on the file where you have put the function.)\
(In `ex_docmd.c` it seems to be enough when you put the prototype.)\
(These are static functions that are put on the top of the file.)

Now run
```
make cmdidxs
```

```
make -j8
```

```
./vim
```

```
:echohello
```
And that should print a `hello world` message.

#### make test

`make test` seems to want documentation for new ex commands:
```
Found errors in Test_cmd_lists():
command line..script .../vim/src/testdir/runtest.vim[636]..function RunTheTest[63]..Test_cmd_lists line 57: Missing commands from `:help ex-cmd-index`: [':bxit']: Expected 0 but got 1
```

The test that fails is in `src/testdir/test_cmd_lists.vim`.

To run only this test
```
make test_cmd_lists
```

Putting the documentation in `/runtime/doc/index.txt` in the list at \
`ex-cmd-index :index` did not work.

You need to put pipes around the command like this:
```
|:bxit|         :bx[it]         write the buffer and delete it
```
And the pipes will disappear when editing the file in vim.\
The command will be in yellow color after that.\
With other commands like `less` you can still see the surrounding pipes.

#### ex_ni

What is `ex_ni` (which is used for macros)?

A function in `ex_docmd.c`:
```
/*
 * Function called for command which is Not Implemented.  NI!
 */
    void
ex_ni(exarg_T *eap)
{
    if (!eap->skip)
        eap->errmsg =
                _(e_sorry_command_is_not_available_in_this_version);
}
```

## exarg_T

```
typedef struct exarg exarg_T;
```

The struct `exarg` is defined in `ex_cmds.h`.

#### field errmsg

Probably `exarg->errmsg` should be used for error handling in ex commands:
```
struct exarg {
    ...
    char        *errmsg;        // returned error message
```

If you assign an error message to it:
```
eap->errmsg = "Writing buffer has failed!";
```
that will be printed in red after the ex command was executed.

#### field arg

This holds the argument that you pass to the ex command.\
For example ":echo hi" has the `arg` `hi`.

```
char_u* str = eap->arg;
```
