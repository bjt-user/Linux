#### documentation

https://en.wikipedia.org/wiki/Sc_(spreadsheet_calculator) \
https://www.economics.utoronto.ca/jfloyd/stats/minmansc.pdf

enter this command if `sc` is installed:
```
sc /usr/share/doc/sc/tutorial.sc
```

#### installation

```
sudo pacman -S sc
```

```
man sc
```

#### navigation

Vim key bindings or arrow keys.

#### enter number into cell

In command mode hit `=` then enter the number \
then hit `enter`.

#### enter strings

`<` for left aligned string.\
`>` for right aligned string.

Hitting `"` does not work...which should create centered string

#### enter formulas

Hit `=` in command mode.\
Enter `A1+A2` to add cells.\
Hit `enter`.

Sum of a range of cells:
`@sum(B1:B3)`

#### save file

`P` then enter the file name and hit `enter`.

#### quit

`q`

#### save and quit

`ZZ`

#### TODO: do not write a backup file myfile.sc~

https://github.com/n-t-roff/sc?tab=readme-ov-file#sc-spreadsheet-calculator:
> By default sc made a backup of the database file before overwriting it.\
This could only be changed at compile time. There are now options backup and !backup to control this.

> Configured at compile time, sc always did update the history file ~/.sc_history.\
It is now possible to change this filename with the .scrc command histfile or save no history at all with an empty command argument.
