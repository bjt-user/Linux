## general info

#### documentation
```
man 1 grep
```

Full documentation:
```
info grep
```

#### regex flavors

> grep understands three different versions of regular expression syntax:\
“basic” (BRE), “extended” (ERE) and “perl” (PCRE).

> Basic vs Extended Regular Expressions \
In basic regular expressions the meta-characters `?`, `+`, `{`, `|`, `(`, and `)` lose their special meaning;\
instead use the backslashed versions `\?`, `\+`, `\{`, `\|`, `\(`, and `\)`.

## architecture

### character classes

```
info grep 'character classes'
```

#### alphanumeric characters

https://en.wikipedia.org/wiki/Alphanumericals

> The complete list of alphanumeric characters is \
`ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789`

```
‘[:alnum:]’
     Alphanumeric characters: ‘[:alpha:]’ and ‘[:digit:]’; in the ‘C’
     locale and ASCII character encoding, this is the same as
     ‘[0-9A-Za-z]’.
```

For example grep lines that start with alphanumeric characters:
```
grep "^[[:alnum:]]" main.s
```

## usage

#### basic usage
```
grep -ni word file1.txt
```
prints all lines that contain the word "word" from the file "file1.txt"
(option i for "ignore case" (not case sensitive))
(option n to show the line numbers)

#### print lines after and before (-A, -B)

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

#### ommit blank lines
```
cat LocalSettings.php | grep -v "^$"
```

#### grep -o

Extract parts of a line by matching a regex:
```
$ echo "apache-tomcat-9.0.98" | grep -o "[0-9.].*"
9.0.98
```

#### pgrep - grepping for processes

this will just output the corresponding PID:
```
pgrep 'string'
```

I think it only searches for the basename of the binary of the command:
```
$ pgrep 'fi'
549
2475
9765
```

You can search for the full command with the `-f` flag.\
The `-a` flag shows the command in addition to the pid.
```
$ pgrep -af '/bin/bash'
8298 /bin/bash
9789 /bin/bash
```

You have to escape curly brackets.
```
$ pgrep -af "/usr/lib/firefox/firefox -contentproc -parentBuildID 20231116134553 -prefsLen 34000 -prefMapSize 235650 -appDir /usr/lib/firefox/browser \{4f14bb5b-9b52-429a-8276-940e83ee16e8\} 2475 true socket"
2574 /usr/lib/firefox/firefox -contentproc -parentBuildID 20231116134553 -prefsLen 34000 -prefMapSize 235650 -appDir /usr/lib/firefox/browser {4f14bb5b-9b52-429a-8276-940e83ee16e8} 2475 true socket
```

RC 0 if process exists.\
RC 1 if process does not exist.

check for processes by the user who owns the process:
```
# pgrep -afu postgres
```
