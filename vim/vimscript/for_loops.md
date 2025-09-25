## examples

#### range from 1 to 10

```
for i in range(1, 10)
	echo i
endfor
```

Prints numbers from 1 to 10.

#### iterate through all lines of a file

This will print the contents of every line of a file:
```
for i in getline(1, '$')
	echo i
endfor
```

#### iterate through all lines numbers of a file

If you need the line number of every file and don't want to increment \
a counter:
```
for lineno in range(1, line('$'))
	echo lineno
endfor
```
This will print every line number.
