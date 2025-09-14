## general information

More useful than `search` because it also returns the column of the first char \
of the match.

## examples

#### search for "words" backwards from cursor position

```
syn keyword words
	\ foo

highlight words cterm=inverse

let foo = searchpos("words", "bn")

echo foo
```
The output depends on the cursor position.

Possible output is:
```
[6, 11]
```
Where the first number is the row and the second the column of the first char.

#### only search in current line and only return the col

```
vim9script

echo "words"

var foo = searchpos("words", "bn", line('.'))[1]

echo foo
```
Depending on the cursor pos it will output:
```
0
```
or
```
22
```
or
```
7
```
