## general info

```
col({expr} [, {winid}])		Number	column byte index of cursor or mark
```

```
col({expr} [, {winid}])					col()
		The result is a Number, which is the byte index of the column
		position given with {expr}.
		For accepted positions see getpos().
		When {expr} is "$", it means the end of the cursor line, so
		the result is the number of bytes in the cursor line plus one.
		Additionally {expr} can be [lnum, col]: a List with the line
		and column number. Most useful when the column is "$", to get
		the last column of a specific line.  When "lnum" or "col" is
		out of range then col() returns zero.

		With the optional {winid} argument the values are obtained for
		that window instead of the current window.

		To get the line number use line().  To get both use
		getpos().
		For the screen column position use virtcol().  For the
		character position use charcol().

		Note that only marks in the current file can be used.

		Examples:
			col(".")		column of cursor
			col("$")		length of cursor line plus one
			col("'t")		column of mark t
			col("'" .. markname)	column of mark markname

		The first column is 1.  Returns 0 if {expr} is invalid or when
		the window with ID {winid} is not found.
		For an uppercase mark the column may actually be in another
		buffer.
		For the cursor position, when 'virtualedit' is active, the
		column is one higher if the cursor is after the end of the
		line.  Also, when using a <Cmd> mapping the cursor isn't
		moved, this can be used to obtain the column in Insert mode:
			:imap <F2> <Cmd>echowin col(".")<CR>

		Can also be used as a method:
			GetPos()->col()

		Return type: Number
```

## examples

#### get current col

```
vim9script

var myvar = col('.')

echo myvar
```
Will output the number of the current column the cursor is at.
