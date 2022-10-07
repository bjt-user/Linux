grep -ni word file1.txt       prints all lines that contain the word "word" from the file "file1.txt"
(option i for "ignore case" (not case sensitive))
(option n to show the line numbers)

Show the 6 lines AFTER the search patterns:
```
grep -A6 march ~/.bash_profile
```

Show the 6 lines BEFORE the search pattern:
```
grep -B6 march ~/.bash_profile
```

#### grep for multiple strings

You have to escape a pipe inside the double quotes.
```
cat /etc/os-release | grep -i "name\|version"
```
