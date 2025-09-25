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
