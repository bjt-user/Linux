## general info

```
:h terminal-screendump
```

`*.dump` files are just ascii text:
```
$ file testdir/dumps/sh_functions_bash_00.dump
testdir/dumps/sh_functions_bash_00.dump: ASCII text
```

#### whitespace before EOF

Screendumps require a space at the end of the file.\
But vim or helix cannot add the space at the end.\
Adding a space at the end will not work.\
After saving the file, the space will be gone.

You can add a space at the end of the file with `gedit`!

Another way seems to be to copy the failed file from `testdir/failed` to \
`testdir/dumps`.\
But this might fail.

You have to `mv` or `cp` without using the `.` at the end.\
You have to write the entire file name by hand!\
This way the trailing space will remain!
