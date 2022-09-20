Get the size of a directory or a file.\
Use option `s` for summary.\
`h` for human-readable.

```
du -sh .
```

```
du -sh path/to/myfile.idk
```

#### difference to ls

The output slightly differs to the output of the Nautilus file manager.\
That may be caused by difference between Megabyte and Mibibyte.\
Nautilus and `ls -la` have the same output.

```
du -b filename
```
this shows the bytes of a file (similar number to `ls -la` and `nautilus`)

https://superuser.com/questions/94217/why-ls-and-du-show-different-size

`ls` is reporting the allocated size; `du` is reporting the amount of space actually used.


