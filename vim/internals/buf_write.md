## general info

Function in `bufwrite.c`.

Gets called when you hit `:w` and then enter.

Has a while loop that seems to loop through the entire file content.

#### call graph

do_write->buf_write
