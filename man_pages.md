## general info

#### installation

To use the `man` command you need to install:
```
sudo pacman -S man-pages man
```

#### understanding manpages

There is a manpage about manpages.

```
man man
```

#### sections

The man pages are divided into numbered sections; for programmers, the most
important are these:

- (1) User commands
- (2) System calls
- (3) Standard library functions
- (8) System/administrative commands

The numbers denote man page sections.

To look up a man page, simply invoke `man name` , where name is a
command or function name. In a few cases, the same name occurs in more than one section; you
can specify the section explicitly by placing the section number before the name. For example, if
you type the following, you'll get the man page for the sleep command (in section 1of the Linux
man pages):
```
% man sleep
```
To see the man page for the sleep library function, use this command:
```
% man 3 sleep
```

The `whatis name` command displays all man pages (in all sections) for a command or function matching name .

```
$ whatis sleep
sleep (1)            - delay for a specified amount of time
sleep (3)            - sleep for a specified number of seconds
```

## usage

#### Searching for man pages

type for example `man term` and hit <kbd>tab</kbd> twice

Each man page includes a one-line summary of the command or function.

If you're not sure which command or function you want, you can perform a keyword search on the
summary lines, using `man -k keyword`.

***
#### Searching in man pages
```
/pattern
```
After that type <kbd>n</kbd> to get to the next occurence of the word.

Advanced:
The command above is doing a forward search.
To do a backward search type:
?pattern

You can type <kbd>N</kbd> to go for the next occurence in reverse direction.

searching for flags:
```
/^\s+--compress
```
or
```
/^\s*-d
```
(`\s` for whitespace)

#### reading raw manpages manual

```
zless /usr/share/man/man3/assert.3.gz
```

## troubleshooting

#### missing manpages

wsl with arch linux:\
you get `no man pages for xy` no matter what you type.

`/etc/pacman.conf` has this line in it:
```
NoExtract  = usr/share/man/* usr/share/info/*
```

then do
```
pacman -S man-db man-pages
```

=> and man-pages work again!
