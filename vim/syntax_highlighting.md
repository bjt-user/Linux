#### syntax at the end of large files

When jumping to the end of a file with `G` \
on some file types the syntax highlighting is messed up.\
Same happens with `vim +500` for example.

This command might fix it temporarily:
```
:syn sync fromstart
```
