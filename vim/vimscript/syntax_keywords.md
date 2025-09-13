#### keywords with special characters

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
