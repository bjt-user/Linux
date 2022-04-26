#### Navigation
In normal mode:\
`fp`    : to go to the next occurance of the letter "p" in the current line

`gg`    : go to first line\
`G`     : go to last line

#### save and quit
Usually you do `:wq` to write and quit, but you can also do `:x`.\
`:x` saves only if you actually made changes and then quits, otherwise it just quits.

#### paste something from the clipboard into vim
ctrl + shift + v (does only work in putty sessions if you enable it in settings)

OR:

Copy some text to the clipboard with ctrl + c -> go into vim
-> go into insert mode (i) -> go to the menu of the terminal on the upper part of the window (does not work for putty)
-> edit -> paste

OR:
go into insert mode -> shift + einfg

To turn off autoindent when you paste code, there's a special "paste" mode.

Type
```
:set paste
```
Then paste your code. Note that the text in the tooltip now says `-- INSERT (paste) --`.

After you pasted your code, turn off the paste-mode, so that auto-indenting when you type works correctly again.
```
:set nopaste
```

#### copy from vim to the system clipboard
**Does not** seem to **work** on a typical vim installation.

stackoverflow-Quote:\
*You must have vim compiled with the +clipboard feature for ANY of the below suggestions to work in the first place! This is NOT the default on most systems.*

#### copy some text and replace another part of the file with it

go to the beginning of the word
type "v" and select the word with navigation keys
"y" to yank
go to the next word
type "v" and select the word with navigation keys
"p" to paste

OR:
go to the beginning of the word
"yw" to yank word
go to the next word
"vw" to select word
"p" to paste

#### Search and replace

Sometimes you have a string that has multiple occurances in the file
and you want to replace it with another string.
But usually you don't want to do this operation for the entire file.

This replaces the word "search" with the word "replace" in line 8 to 10:
:8,10 s/search/replace/g

There are some symbols that can be used in the range part of the command.
For example:
```
:0,$ s/badword/goodword/g
```
for the entire file

or

:.,$s/foo/bar/
for the current line until the end of the file


#### Search

```
/pattern
```

hit `n` to go to the next occurence

or hit `/` and `<enter>` to get to the next occurence\
`?` and `<enter>` to go in reverse direction
```
/\cpattern
```
for case insensitive search

To get rid of the highlighted patterns:
`:nohl`

#### go to definition / file / link

`gd` will take you to the local declaration\
`gD` will take you to the global declaration\
`g*` search for the word under the cursor (like `*`, but `g*` on 'rain' will find words like 'rainbow')\
`g#` same as `g*` but in backward direction\
`gf` will go to the file under the cursor\
`gx` will open a link in firefox (but it has the downside that you can't save the file afterwards)

I hit `gD` while the cursor was at the call of a bash function that was declared in the same file.\
And it took me to the function declaration.

#### Vimdiff ohne Farbcodierung:

Folgendes in die .vimrc schreiben (wenn sie nicht existiert im home-Verzeichnis, dann neue Datei anlegen):

if $COLOR=='OFF'
  set t_Co=0
endif


Und vimdiff mit folgendem Befehl aufrufen: COLOR=OFF vimdiff file1 file2
Das diffchange highlighting bleibt leider, kann man aber mit :hi DiffText term=none ausstellen (hat bei mir nicht in der vimrc funktioniert) 

#### Disable yellow highlighting (search results or something similar)
```
:nohl
```

#### colorschemes

to view the current color scheme:
```
:colorscheme
```
or
```
:color
```

to see all installed color scheme:
```
:colorscheme [space] [tab]
```
or
```
:color [space] [tab]
```

And you can cylce throug them.

To select a color scheme:
```
:color industry
```

You can write
```
color industry
```
into .vimrc to set it permanently

---

If colors annoy you:
```
:syntax off
```

#### AUTOCOMPLETION

There is autocompletion in plain vim without installing any plugins.
Out of the box it only works for words that were already used within the current file.
To get a list of words that can be made out of the current letters:
ctrl + n

How can you cycle through those words?
ctrl + p
and
ctrl + n

Once a word is selected it is placed into the editor and you can keep on writing.

#### autoformat

type
```
gg=G
```
This will fix all indentations in the file. (`vim 8.0`)

Did **not** work in `vim 7.4`.\
It said `6 lines indented` but did nothing.\
It seems to work for `if`s, but not for functions.

-----------------------------------------------------------------------------------------------------------------------------

#### Mehrere Dateien (nebeneinander) öffnen:

```
:vsplit dateiname
```
oder
```
:split dateiname
```
Scheinbar kann man so beliebig viele Dateien nebeneinander öffnen.
Zwischen den Dateien wechseln:
ctrl + w + w (w doppelt drücken)
oder
ctrl + w + h (nach links wechseln)
ctrl + w + l (nach rechts wechseln)

to close every window except the current one:
:only

to close all windows:
:qa
or
:qa! (to discard changes)

Outside of vim:
```
vim -O file1 file2
```
-----------------------------------------------------------------------------------------------------------------------------

#### Execute terminal commands inside of vim
---------------------------------------
to execute a bash script (% stands for the file name that is opened in vim)
```
:!./%
```
or to first clear terminal and then execute script:
```
:!clear;./%
```
(vim doesnt know about aliases that are set in the terminal)


#### How to see the detected filetype

```
:set ft?
```
-----------------------------------------------------------------------------------------------------------------------------

#### Help
```
:help
```
```
:help <topic>
```
When in help type :only to make the help screen full screen.


### .vimrc and vimscripting

#### Key Mappings in VIM
-------------------
https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

Folgendes in die .vimrc reinschreiben (to execute the bash script that is opened in vim):
```
nmap <F5> :!clear;./% <CR>
```
To map keys that work only in the normal mode, use the ':nmap' or ':nnoremap' command.
The 'n' in ':nmap' and ':nnoremap' denotes normal mode.
<CR> bedeutet, dass der command auch direkt ausgeführt wird und nicht mit ENTER bestätigt werden muss.

"noremap" means The {rhs} of the map is not re-mappable.
=> which does not seem to work for me

" the autoindent feature inserts an indent if it detects an indent in the line before "
" you can delete it again with <backspace> key or ctrl+D "
set autoindent

" the smartindent feature makes an indent after { and so on and it seems to stop after } "
set smartindent

------------------------------------------------------------------------------------------------------------


#### Implementing a status line in VIM:
----------------------------------
```
" STATUS LINE ------------------------------------------------------------ {{{
" spaces are escpaed with "\ " "

set statusline=

set statusline+=%F
set statusline+=\ %M
set statusline+=\ %Y
set statusline+=\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=ascii:\ %b
set statusline+=\ hex:\ 0x%B
set statusline+=\ row:\ %l
set statusline+=\ col:\ %c
set statusline+=\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
```

#### INSTALLING PLUGINS

To find out which files Vim has actually loaded, execute
```
:scriptnames
```
installing plugins without root access:
Copy plugin/auto-pairs.vim to ~/.vim/plugin
https://github.com/jiangmiao/auto-pairs
(closes "(", "[", "{" automatically)

Pasting manually into a putty session with vim does not really work.
(formatting issues which can maybe be fixed)
(maybe problems come from "set autoindent")
git clone git clone https://github.com/vim-scripts/Auto-Pairs
Try pasting into "vi" next time to prevent formatting failures.

#### Markdown (.md files)

These observations were made in vim version 8.2.\
.md files will be partly rendered in vim.\
And you can even **follow links** with `gf`. (for local files)\
(see also `:h gf`)

(for internet links you could try `gx`)\
netrw should open the link with the external handler (see :h netrw-gx)
