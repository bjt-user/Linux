## general information

More useful than `search` because it also returns the cursor position.

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
