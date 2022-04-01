#### Useful shortcuts and tricks while entering commands in a terminal

*these work in Debian*

Jumping a word back/forward while entering commands in the terminal:\
ctrl + arrowkeys *(does not work in Putty)*\
or\
alt + f -> to move one word forward\
alt + b -> to move one word backwards

ctrl + f -> move one character forward\
ctrl + b -> move one character back

Go to the beginning of the line:\
ctrl + a

To delete from the cursor position to the end of the line:\
ctrl + k

to delete everything from cursor position to the beginning of the line:\
ctrl + u

to delete one word (space delimited) backwards:\
ctrl + w

to delete the character at cursor position:\
ctrl + d\
(only works if there is something to delete, otherwise it will terminate the shell)

to delete the character in front of the cursor (backspace):\
ctrl + h

to yank the text back you just deleted:\
ctrl + y

to switch two words (space separated) around:\
alt + t

to go back and forth in history (without using arrowkeys):\
ctrl + p\
ctrl + n

the equivalent to <enter> (executes a command):\
ctrl + m

***

Opening a terminal that is not part of the GUI:\
ctrl + alt + F3

Going back to GUI:\
ctrl + alt + F2

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
ctrl + r\
(then once you find something you can hit ctrl + r again to go through multiple commands)

***
#### more tips for productivity and speed

This takes you back to the directory you have previously been in:
```
cd -
```

Put this in your .bashrc or .bash_profile or whatever you have:
```
bind Space:magic-space
```

Then you can do `!!` and then press `<space>` to expand that command before entering it.\
Or `!cd`, then `<space>`, `!105`, then `<space>` etc...
