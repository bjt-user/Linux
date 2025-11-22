## general info

Function in `eval.c`.

```
/*
* Handle top level expression:
*      expr2 ? expr1 : expr1
*      expr2 ?? expr1
*
* "arg" must point to the first non-white of the expression.
* "arg" is advanced to just after the recognized expression.
*
* Return OK or FAIL.
*/
    int
eval1(char_u **arg, typval_T *rettv, evalarg_T *evalarg)
```

## how arguments change

Debug output from a call to `:echo` with a variable that contains \
the string `foo`.
```
(gdb)
7723		if (eval1(&arg, &rettv, &evalarg) == FAIL)
(gdb) p arg
$3 = (char_u *) 0x556f3afed765 "myvar"
(gdb) p rettv
$4 = {v_type = 3505461584, v_lock = -4 '\374', vval = {
    v_number = 93935709155233, v_float = 4.6410406811335688e-310,
    v_string = 0x556f1c936fa1 <find_ex_command+3468> "\205\300uHH\203}\200",
    v_list = 0x556f1c936fa1 <find_ex_command+3468>,
    v_dict = 0x556f1c936fa1 <find_ex_command+3468>,
    v_partial = 0x556f1c936fa1 <find_ex_command+3468>,
    v_job = 0x556f1c936fa1 <find_ex_command+3468>,
    v_channel = 0x556f1c936fa1 <find_ex_command+3468>,
    v_blob = 0x556f1c936fa1 <find_ex_command+3468>,
    v_instr = 0x556f1c936fa1 <find_ex_command+3468>,
    v_class = 0x556f1c936fa1 <find_ex_command+3468>,
    v_object = 0x556f1c936fa1 <find_ex_command+3468>,
    v_typealias = 0x556f1c936fa1 <find_ex_command+3468>,
    v_tuple = 0x556f1c936fa1 <find_ex_command+3468>}}
(gdb) p evalarg
$5 = {eval_flags = 1, eval_break_count = 0, eval_getline = 0x0,
  eval_cookie = 0x0, eval_cctx = 0x0, eval_cstack = 0x7ffcd0f11d10,
  eval_ga = {ga_len = 0, ga_maxlen = 0, ga_itemsize = 0, ga_growsize = 0,
    ga_data = 0x0}, eval_freega = {ga_len = 0, ga_maxlen = 0,
    ga_itemsize = 0, ga_growsize = 0, ga_data = 0x0}, eval_tofree = 0x0,
  eval_tofree_ga = {ga_len = 0, ga_maxlen = 0, ga_itemsize = 8,
    ga_growsize = 20, ga_data = 0x0}, eval_using_cmdline = 0,
  eval_tofree_lambda = 0x0}
(gdb) n
7736		need_clr_eos = FALSE;
(gdb) p arg
$6 = (char_u *) 0x556f3afed76a ""
(gdb) p rettv
$7 = {v_type = VAR_STRING, v_lock = 0 '\000', vval = {
    v_number = 93936221677136, v_float = 4.6410660030800701e-310,
    v_string = 0x556f3b1fe650 "foo", v_list = 0x556f3b1fe650,
    v_dict = 0x556f3b1fe650, v_partial = 0x556f3b1fe650,
    v_job = 0x556f3b1fe650, v_channel = 0x556f3b1fe650,
    v_blob = 0x556f3b1fe650, v_instr = 0x556f3b1fe650,
    v_class = 0x556f3b1fe650, v_object = 0x556f3b1fe650,
    v_typealias = 0x556f3b1fe650, v_tuple = 0x556f3b1fe650}}
(gdb) p evalarg
$8 = {eval_flags = 1, eval_break_count = 0, eval_getline = 0x0,
  eval_cookie = 0x0, eval_cctx = 0x0, eval_cstack = 0x7ffcd0f11d10,
  eval_ga = {ga_len = 0, ga_maxlen = 0, ga_itemsize = 0, ga_growsize = 0,
    ga_data = 0x0}, eval_freega = {ga_len = 0, ga_maxlen = 0,
    ga_itemsize = 0, ga_growsize = 0, ga_data = 0x0}, eval_tofree = 0x0,
  eval_tofree_ga = {ga_len = 0, ga_maxlen = 0, ga_itemsize = 8,
    ga_growsize = 20, ga_data = 0x0}, eval_using_cmdline = 0,
  eval_tofree_lambda = 0x0}
```

So the string `foo` is afterwards in `rettv`, arg is empty again.\
`evalarg` does not seem to change.
