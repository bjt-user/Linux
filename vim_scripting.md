## general

Vim scripts have the .vim ending.
To execute a vimscript type `:source %`
(or `:so %`)

If you put your example.vim file into `~/.vim/plugin` it gets executed everytime you start vim.\
There is also the folder `~/.vim/ftplugin` for plugins that are for specific filetypes, but for a start thats too complicated.

see functions you can use with argument explanation:
`:help functions`

https://devhints.io/vimscript-functions

#### documentation

https://vimhelp.org/

https://vimhelp.org/usr_41.txt.html#usr_41.txt

https://vimhelp.org/usr_50.txt.html#usr_50.txt

I am trying to build a function that comments the line if it is not commented
or uncomment if it is commented no matter in which column the cursor is.\
And at the same time not overwriting any registers.
(for example if you do "dd" that line is saved in a register)

To go into insert mode and insert the text "new text" do this:
execute "normal Inew text \<Esc>

#### test vimscripts

Create a file named `foo.vim`.\
After opening the file and putting some vimscript in it\
you can execute the script with:\
`:%so`

---
#### initialize variables

```
let name = "John"

echo "Hello, " . name
```

in vim9script this works:
```
def Format()
    var message = 'oh hi mark'
    echomsg message
enddef
```
---

getting the cursor position:
```
let colpos=col('.')

echo colpos
```
getting the line number where the cursor is currently at:
```
let linepos=line('.')

echo linepos
```


#### functions

It looks like function names have to start with an upper case character otherwise you get an error.\
Use `function!` so you don't get errors when opening multiple files. (i.e. `vim -O file1 file2`)

filetype plugins
----------------

Put a file named `sh_something.vim` into `~/.vim/ftplugin/`
write
```
echo "this is a shell script!!!"
```
and it will be executed everytime you open a file with filename *.sh with vim

It is also recognized as shell script when you have a `#!/bin/bash` in the first line
and a different fileending.

-------------------------------------------------------------------------------------------------------

```
function Commenter ()
  let curline=getline('.')

  let firstpart=strpart(curline, 0, 1)

  normal 0

  if firstpart == "\""
    "typing "_x deletes one character in vim without putting it in register:
    normal "_x
  else
    execute "normal i\"\<Esc>"
  endif
endfunction
```

Put this in a file in `.vim/plugin/filename.vim`

Then you can execute this function in vim with `:call Commenter()`


#### vim manual

On the cli type `vim`. enter `:help`. enter `:only` to view the help in the whole screen.

When you scroll down you see help files you can go into by placing the cursor on them and typing `gf` (goto file).

#### comments
```
"this is a comment in vimscript
```
in vim9script you can use `#`

## builtin functions

TODO: how to get a list of all builtin functions

#### expand

You might need this here and there to expand the current file to a string or something else.\
`:h expand`
```
echo expand('%')
```

#### system

example: (get the number of lines of the current file)
```
vim9script

var shell_result = system('wc -l ' .. expand('%:p'))

echo shell_result
```

#### sleep

`sleep 2` - sleep for 2 seconds\
`sleep 10m` - sleep for 10 milliseconds

example: (sleep for 5 seconds)
```
vim9script

echo 'I need sleep'
sleep 5
echo 'I woke up'
```

#### autocommands

This is a great explanations of how autocommands work:\
https://learnvimscriptthehardway.stevelosh.com/chapters/12.html

## buffers

#### replace buffer with a variable

delete the current buffer with `:%d` and put the variable foo in the second line:
```
vim9script

var foo = 'bar'
:%d
:put =foo
```

## ex(ternal) commands

#### silencing

You can silence a command so that no output is shown like this:
```
silent !shfmt -w %
```
But most of the time this will have negative effects and you will have to redraw the screen like this afterwards:
```
:redraw!
```

And even that does not seem to work in all situations.

#### operate on the current buffer (with external program)

`:%!indent -linux`

This works well and you don't have to save the file.\
The downside is that when the external program fails \
it writes the error into the current buffer.\
You can always undo and go to the previous buffer with `u`.

#### return code of ex commands

After an ex command the variable `v:shell_error` is set.

```
:!echo '
:echo v:shell_error
```

## vimscript9

https://vimhelp.org/vim9.txt.html

From `:help vim9`:\
The Vim9 script syntax and semantics are used in:
- a function defined with the :def command
- a script file where the first command is vim9script
- an autocommand defined in the context of the above
- a command prefixed with the vim9cmd command modifier

So by default you still have the old vimscript active.

#### line continuation in vim9script

Note that this is vim9script syntax:
```
def Long_echo()
	!clear;
	\echo 'hello
	\hoe
	\hoe'
enddef
```
These four lines will be executed as one external command.

#### string concatenation

In vim9script the `.` does not work anymore.\
You have to use `..`:
```
vim9script

var mystring = "this is the file " .. "foo"
echo mystring
```
