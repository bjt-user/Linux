## general info

in `charset.c`:
```
char_u * transchar_buf(buf_T *buf, int c)
```
The second argument is the number of the character according to \
the ascii table.

Might convert ansi escape sequences into something else?

Looks more like it converts wide unicode chars to something else.

Also not that useful as a breakpoint because this function is almost \
always active.

## basic call graph

This happens when entering characters after `:`:\
transchar -> transchar_buf

It can also look like this when hitting enter after `:echo "foo"`:
```
#0  transchar_buf (buf=0x0, c=102) at charset.c:537
#1  0x0000557f5d02997c in transchar_byte_buf (buf=0x0, c=102) at charset.c:580
#2  0x0000557f5d03b1ab in msg_outtrans_len_attr (msgstr=0x557f5d344050 "foo", len=0, attr=0) at message.c:1796
#3  0x0000557f5cd23297 in echo_one (rettv=0x7fff6aff39d0, with_space=1, atstart=0x7fff6aff39b4, needclr=0x7fff6aff39b0) at eval.c:7691
#4  0x0000557f5cd234c2 in ex_echo (eap=0x7fff6aff3b20) at eval.c:7751
#5  0x0000557f5cd59a3a in do_one_cmd (cmdlinep=0x7fff6aff3d50, flags=0, cstack=0x7fff6aff3e30, fgetline=0x557f5cd736ae <getexline>, cookie=0x0)
    at ex_docmd.c:2629
```

## modifications

#### make escape character printable

What happens if you make character 27 (escape) character printable?

Then ansi escape sequences are actually printed in color.\
But after them follow some characters from the previous command.

=> Debug to see what happens here
