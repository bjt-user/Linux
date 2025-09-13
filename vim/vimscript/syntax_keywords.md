#### keywords with special characters

> It will only match with a complete word

The definition of a word in vim:\
> A word consists of a sequence of letters, digits and underscores, or a \
sequence of other non-blank characters, separated with white space (spaces, \
tabs, <EOL>).  This can be changed with the 'iskeyword' option.\
An empty line is also considered to be a word.

Keywords with dots (`.`) inside don't seem to work.

```
set iskeyword?
```
outputs:
```
iskeyword=@,48-57,_,192-255,#
```

ASCII chars 48-57 are 0-9.\
192-255 are latin characters.

The period is 46 so it should be allowed, but it doesnt work.
