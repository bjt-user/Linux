### vim usage

#### open file

With `vim myfile +command` you can execute a command in vim at startup.

open a file and put the cursor in line 25:
```
vim myfile.c +25
```

#### Navigation (in the file)

In normal mode:\
`fp`    : to go to the next occurance of the letter "p" in the current line \
`Fp`    : to go to the previous occurance of the letter "p" in the current line

`gg`    : go to first line\
`G`     : go to last line

<kbd>ctrl + f</kbd> : go one page forward (but still display the last two lines for continuity)\
<kbd>ctrl + b</kbd> : go back one page

#### Navigation (in the filesystem)

```
:E(xplore)
```

go back to your file
```
:Re(xplore)
```

This way you can choose another file to open.\
Select a file and hit `o` to open it in horizontal split.\
`v` for vertical split.\
`Enter` to open in the entire window/tab.

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
:%s/foo/bar/g
```

or (a longer and worse way of doing the same thing)

```
:0,$ s/badword/goodword/g
```

for the entire file

or

```
:.,$s/foo/bar/
```

for the current line until the end of the file

or

```
:5,10s/\[/\[\[
```

to replace in lines 5-10 one `[`  with two `[[` (they need to be escaped)

use the `c` flag to confirm each substitution!
```
:%s/foo/bar/c
```
then confirm with <kbd>y</kbd>

---

#### Search

```
/pattern
```

hit `n` to go to the next occurrence\
hit `N` to go to the previous occurrence

or hit `/` and `<enter>` to get to the next occurence\
`?` and `<enter>` to go in reverse direction

```
/\cpattern
```

for case insensitive search

To get rid of the highlighted patterns:
`:nohl`

You can also **search after the word under the cursor** with `*` (forward search) and `#` (backward search)

The search pattern seems to be in regex.\
You can search for everything that is in between backticks `` ` `` like this:
```
/`.*`
```

#### go to definition / file / link

`gd` will take you to the local declaration\
`gD` will take you to the global declaration\
`g*` search for the word under the cursor (like `*`, but `g*` on 'rain' will find words like 'rainbow')\
`g#` same as `g*` but in backward direction\
`gf` will go to the file under the cursor\
`gx` will open a link in firefox (but it has the downside that you can't save the file afterwards)

I hit `gD` while the cursor was at the call of a bash function that was declared in the same file.\
And it took me to the function declaration.

#### delete until character

Type `dt"` to delete everything until the next `"` character appears.\
Type `dTf` to delete from the current character backwards until an `f`.

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

***

#### opening multiple files (horizontal split or vertical split)

```
:vsplit dateiname
```

or

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

<kbd>ctrl</kbd> + <kbd>w</kbd> <kbd>r</kbd> - will put the window on the left to the right and vice versa (or the window at the bottom to the top)

to close all windows:
:qa
or
:qa! (to discard changes)

Outside of vim (for vertical split):

```
vim -O file1 file2
```

You can then go into each window and type
```
:set scrollbind
```
on both sides. Then you will scroll down both sides at the same time.

to disable:
```
:set noscrollbind
```

***

#### multiline edit

to write in multiple lines at once:

- press <kbd>ctrl + v</kbd> to go into visual block mode
- move down or up one or more lines (with <kbd>j/k</kbd>)
- press <kbd>shift + i</kbd>
- type your text (you will only see it appear in one line)
- hit <kbd>Esc</kbd>
  => and your text will appear in multiple lines

***

#### Execute terminal commands inside of vim

to execute a bash script (% stands for the file name that is opened in vim)

```
:!./%
```

or to first clear terminal and then execute script:

```
:!clear;./%
```

(vim doesnt know about aliases that are set in the terminal)

***

#### How to see the detected filetype

```
:set ft?
```

#### detect trailing whitespace
```
:set list
```
***

#### tabs

Since vim 7 there are tabs.\
https://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim#53668

`:tabe [tab-key]` - open a file in a new tab (hit <kbd>tab</kbd> for a very nice tab-completion)

I put this in my vimrc to switch between tabs with ctrl + n/p in normal mode:
```
"working with tabs (feature since vim 7)
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>
```
ctrl + n/p is used for completion, but only in insert mode, and I want to switch tabs only in normal mode.\
So this seems to work.

#### buffers

https://linuxhandbook.com/vim-buffers/

> Technically speaking, a buffer is anything that is loaded into the memory which is going to be used in the immediate future. The green progress bar in YouTube videos is an excellent example of a buffer. Now, talking about buffers in context with Vim, it means any file that you have opened in Vim that is stored in the memory for editing.

:e (or :edit) to open a file in the active buffer\
you can tab complete and use relative paths

:badd (or :bad) to open a file in the background

:ls to list all files in the current buffer

:b2 to switch to the buffer 2 in the list

:bnext (or :bn) to switch to the next buffer

:bprevious (or :bp) to switch to the previous buffer

***

#### put vim in the background

like any other cli program you can put vim in the background with:\
<kbd>ctrl</kbd> + <kbd>z</kbd>

then you can do stuff like compile your program or something and do:
```
fg
```
to put it back in the foreground

#### Help

```
:help
```

```
:help <topic>
```

When in help type :only to make the help screen full screen.

***

### .vimrc and vimscripting

#### cursor shape and behavior
put this in your .vimrc for a solid nonblinking block:
```
let &t_ve= "\e[?25h\e[?16;143;255c"
```
(because if youre in `$TERM=linux` you start out with a blinking underscore...)

#### Key Mappings in VIM

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

***

#### Implementing a status line in VIM:

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

#### order of vimscripts that are loaded

```
:set runtimepath?
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

#### vim as hex editor

You can use the xxd command to transform a file in Vim to hex representation, doing
```
:%!xxd
```
: enters command-line mode, % matches whole file as a range, ! filters that range through an external command, xxd is that external shell command

Giving an output like this, this is split into octet count/line (octets per line may be changed with parameter -c on xxd command), hex representation, and text representation:

0000000: 5468 6973 2069 7320 6120 7465 7374 0a41  This is a test.A
0000010: 6e6f 7468 6572 206c 696e 650a 416e 6420  nother line.And 
0000020: 7965 7420 616e 6f74 6865 720a            yet another.

Once you make the changes (in the hex part), you can go back to text with -r command on xxd, so
```
:%!xxd -r
```
This is a little rudimentary, though I like it in its simplicity and to keep in mind xxd, which is an interesting command line tool (I don't have to do a lot of work on hex, though). You can use some recipes to handle this transformation in a more automatic way like the one described in Improved hex editing.

And rembember you can also use syntax highlighting for hex editing in vim with that command:
```
:set ft=xxd
```

#### open remote file via scp

```
vim scp://bf@raspberrypi:22//home/bf/.profile
```

Port is optional, so this works too
```
vim scp://myuser@raspberrypi//home/myuser/.profile
```
