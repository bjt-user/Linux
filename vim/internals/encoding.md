`enc_utf8` is a global var.

`globals.h`:
```
EXTERN int      enc_utf8 INIT(= FALSE);         // UTF-8 encoded Unicode

EXTERN int      has_mbyte INIT(= 0);            // any multi-byte encoding
```

From `mbyte.c`:
```
* "has_mbyte" is set when "enc_dbcs" or "enc_utf8" is non-zero.
```
