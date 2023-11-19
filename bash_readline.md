#### Useful shortcuts and tricks while entering commands in a terminal

These key bindings seem to be based on bashs readline program:\
https://www.gnu.org/software/bash/manual/bash.html#Readline-Movement-Commands \
https://www.gnu.org/software/bash/manual/bash.html#Readline-Interaction

*these worked in Debian and seem to work in a Arch Linux console*

Jumping a word back/forward while entering commands in the terminal:\
<kbd>ctrl</kbd> + <kbd>arrowkeys</kbd> *(does not work in Putty)*\
or\
<kbd>alt</kbd> + <kbd>f</kbd> -> to move one word forward\
<kbd>alt</kbd> + <kbd>b</kbd> -> to move one word backwards

<kbd>ctrl</kbd> + <kbd>f</kbd> -> move one character forward\
<kbd>ctrl</kbd> + <kbd>b</kbd> -> move one character back

move cursor to the beginning of the line:\
<kbd>ctrl</kbd> + <kbd>a</kbd>
move cursor to the end of the line:\
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

---

#### configuration

https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File

You can use a `~/.inputrc` file or set an environment variable that points to the location of
the config file.\
If that file does not exist or cannot be read, the ultimate default is `/etc/inputrc`.

---
