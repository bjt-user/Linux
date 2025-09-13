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
