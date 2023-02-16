description: terminal file browser

```
sudo dnf install nnn
```

type `nnn` to start it.

You can use vim keys to navigate.

<kbd>?</kbd> show keybindings\
<kbd>.</kbd> to toggle hidden files on and off\
<kbd>q</kbd> to quit nnn\
<kbd>ESC</kbd><kbd>ESC</kbd> quit\
<kbd>!</kbd> open folder in the terminal\
<kbd>h/l</kbd> - to go up a directory or into a directory\
<kbd>d</kbd> - to toggle file details on and off\
<kbd>e</kbd> open file in the editor that is saved in the environment variable `$VISUAL`\
`/pattern` to search for a file or folder\
<kbd>x</kbd> then confirm with <kbd>y</kbd> - delete a file\
<kbd>n</kbd> create new file/folder/link (hit <kbd>f</kbd> next for file then give it a name)

#### copy or move files

<kbd>space</kbd> select file

type <kbd>2</kbd> for the second tab and select the folder there where you want to copy your file to

<kbd>p</kbd> - for "coPy here"\
<kbd>v</kbd> - for "moVe here"

#### bookmarks

Go to the folder you want to bookmark and hit `B`.\
Then type in the name for the bookmark and hit enter.

To go to a bookmarked location hit `b`, select the bookmark and hit enter.

It works with symlinks in `~/.config/nnn/bookmarks`.

You can also set bookmarks in your `.bashrc` with a variable.

***
