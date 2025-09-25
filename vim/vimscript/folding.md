#### disable folding

Some file types have folding enabled by default and it can be very annoying.

To disable it, put this in the `.vim` file of the file type:
```
set nofoldenable
```

#### get folding level

Get the folding level of the current line:
```
echo foldlevel(".")
```

Instead of passing `"."` you pass a line number.

#### foldnestmax

```
set foldnestmax?
```

> number (default: 20)

> Sets the maximum nesting of folds for the "indent" and "syntax" methods.
This avoids that too many folds will be created.
Using more than 20 doesn't work, because the internal limit is 20.
