#### echo - pager

vim has a `more` pager builtin:
```
vim9script

var long_output = system('ls -l /etc')

echo long_output
```

see `:h pager`

The downside is that this is not compatible with the `less` commands \
or using ctrl + f/b to go up/down one screen.
