to show files that start with "te" and are in the current directory:
```
find . -name te*
```
If you use two asterix like this:
find . -name *te*
you need AT LEAST TWO CHARACTERS!!!
```
find . -iname *na*
```
`-i` is for ignoring case


There are problems with this utility though, it shows folders with permission denied...

Try this:
## redirect error spam message to /dev/null ##
```
find where-to-look criteria action 2>/dev/null
```
```
find . -iname "data*.txt" -print 2>/dev/null
```

