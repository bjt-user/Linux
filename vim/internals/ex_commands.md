## TODO: how to add a new ex command?

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
