## general info

`exists()` can be used to check if a variable exists.

This is helpful because if you check for the value of a var in an if statement \
that does not exist you get a syntax error.

## examples

#### check if var exists

```
vim9script

const foo = 1

if exists("foo") && foo == 1
	echo "foo exists and is 1"
endif
```
