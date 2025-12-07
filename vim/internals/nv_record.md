## general info

Function responsible for the "recording" feature that gets started/stopped by hitting \
`q`.

## basic call graph

`nv_record()` does not get called directly by any function.

All normal commands (`nv_*` functions) probably get called by a function pointer.
