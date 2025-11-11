#### prototype

In `eval.c`:
```
void ex_echo(exarg_T *eap)
```

#### about

It prints an argument to the status line.

The argument is printed after the call of `echo_one`.

`echo_one` calls (among others) this function:
```
int msg_outtrans_len_attr(char_u *msgstr, int len, int attr)
```

#### parameter

```
gdb) p *eap
$2 = {arg = 0x5572c94db915 "system('ansible-doc debug')", nextcmd = 0x0, cmd = 0x5572c94db910 "echo system('ansible-doc debug')", cmdlinep = 0x7ffff0780810,
  cmdline_tofree = 0x0, cmdidx = CMD_echo, argt = 151783428, skip = 0, forceit = 0, addr_count = 0, line1 = 1, line2 = 1, addr_type = ADDR_NONE, flags = 0,
  do_ecmd_cmd = 0x0, do_ecmd_lnum = 0, append = 0, usefilter = 0, amount = 0, regname = 0, force_bin = 0, read_edit = 0, force_ff = 0, force_enc = 0,
  bad_char = 0, useridx = 0, errmsg = 0x0, ea_getline = 0x55728b5db499 <getexline>, cookie = 0x0, cstack = 0x7ffff07808f0}
```

#### basic call graph

When `:echo 'foo'` is executed.

do_cmdline -> do_one_cmd -> ex_echo -> echo_one

do_one_cmd seems to use this call:
```
/*
 * Call the function to execute the builtin command.
 */
(cmdnames[ea.cmdidx].cmd_func)(&ea);
```
to call ex_echo

#### echo_one

It gets called like this:
```
echo_one(&rettv, eap->cmdidx == CMD_echo, &atstart, &needclr);
```

#### cur_tmode

`cur_tmode` is `TMODE_RAW` the entire function.

Changing it to `TMODE_COOK` does not change anything.
