#### source vim9script in legacy script

In your legacy script you can source a `vim9script`:
```
source source_me.vim
```

#### sourcing script paths with variables inside them

The `source` command does not accept any variables.\
So you need to use `execute` with `source`:
```
execute "source " . builtin_modules_file
```

#### getting the path to the scripts dir

When writing plugins you will need the dir of the script.\
You can use `expand()` with `<sfile>` and modifiers `:h:p`:
```
const my_script_file = expand("<sfile>:h:p") . "/my_script.vim"
```
