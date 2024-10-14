#### keyboard shortcuts in a terminal (bash readline)

These key bindings seem to be based on bashs readline program:\
https://www.gnu.org/software/bash/manual/bash.html#Readline-Movement-Commands

So this does not really have anything to do with your terminal.

*these work in Debian and seem to work in a Arch Linux console*

Jumping a word back/forward while entering commands in the terminal:\
<kbd>ctrl</kbd> + <kbd>arrowkeys</kbd> *(does not work in Putty)*\
or\
<kbd>alt</kbd> + <kbd>f</kbd> -> to move one word forward\
<kbd>alt</kbd> + <kbd>b</kbd> -> to move one word backwards

<kbd>ctrl</kbd> + <kbd>f</kbd> -> move one character forward\
<kbd>ctrl</kbd> + <kbd>b</kbd> -> move one character back

Go to the beginning of the line:\
<kbd>ctrl</kbd> + <kbd>a</kbd>
Go to the end of the line:\
<kbd>ctrl</kbd> + <kbd>e</kbd>

To delete from the cursor position to the end of the line:\
<kbd>ctrl</kbd> + <kbd>k</kbd>

to delete everything from cursor position to the beginning of the line:\
<kbd>ctrl</kbd> + <kbd>u</kbd>

to delete one word (space delimited) backwards:\
<kbd>ctrl</kbd> + <kbd>w</kbd>

to delete the character at cursor position:\
<kbd>ctrl</kbd> + <kbd>d</kbd>\
(only works if there is something to delete, otherwise it will terminate the shell)

to delete the character in front of the cursor (backspace):\
<kbd>ctrl</kbd> + <kbd>h</kbd>

to yank the text back you just deleted:\
<kbd>ctrl</kbd> + <kbd>y</kbd>

to switch two words (space separated) around:\
<kbd>alt</kbd> + <kbd>t</kbd>

to go back and forth in history (without using arrowkeys):\
<kbd>ctrl</kbd> + <kbd>p</kbd>\
<kbd>ctrl</kbd> + <kbd>n</kbd>

the equivalent to <enter> (executes a command):\
<kbd>ctrl</kbd> + <kbd>m</kbd>

***

Opening a terminal that is not part of the GUI:\
<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>F3</kbd>

Going back to GUI:\
<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>F2</kbd>

***
to view files on the command line that are bigger than one screen (and maybe when you don't have vi or vim installed) you can use less.
```
less textfile.txt
```

***

#### history and previously executed commands

Execute the previous command:
```
!!
```

Is helpful if you forgot to type sudo before a command.\
Then just type
```
sudo !!
```

```
!vim
```
will print the last `vim` command that you ran and run it again.

You can do something like
```
history | grep myfile.txt
```
(you can tab complete filenames here)\
which will give you a numbered list of your last commands.\
Then type
```
!3
```
to run the command with number 3 in the history.

To view the last n commands might also be helpful sometimes:
```
history | tail -10
```

to search the history:\
<kbd>ctr</kbd> + <kbd>r</kbd>\
(then once you find something you can hit <kbd>ctrl</kbd> + <kbd>r</kbd> again to go through multiple commands)

***
#### more tips for productivity and speed

This takes you back to the directory you have previously been in:
```
cd -
```
***
Put this in your .bashrc or .bash_profile or whatever you have:
```
bind Space:magic-space
```

Then you can do `!!` and then press `<space>` to expand that command before entering it.\
Or `!cd`, then `<space>`, `!105`, then `<space>` etc...

#### type of the terminal

If you have no display server and just the console (for example after an Arch install),\
you can type
```
echo $TERM
```
and it will say
```
linux
```

#### change cursor

how to change the cursor in the pure `linux` terminal.

in the pure arch-linux terminal the cursor is a blinking underscore.

You can modify your `.bashrc` (or `.bash_profile` if you don't have a `.bashrc`) like this:
add this line before the `PS1` statement and make sure `PS1` statement has double quotes:
```
cursor_styles="\e[?16;2;112;c"
PS1="[\u@\h \W]\$${cursor_styles} "
```
```
source ~/.bashrc
```

16 means a solid, non-blinking block,\
2 means cursor_foreground_black=2\
112 means cursor_background_white=112

This link contains all colors and styles: https://gist.github.com/anonymous/8f1e6c22b5213faf8170dcfc2b0f5b93
