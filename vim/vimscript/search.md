## general information

```
search({pattern} [, {flags} [, {stopline} [, {timeout} [, {skip}]]]])
        Search for regexp pattern {pattern}.
        The search starts at the cursor position (you can use cursor() to set it).

        When a match has been found its line number is returned.
        If there is no match a 0 is returned and the cursor doesn't
        move.  No error message is given.
        To get the matched string, use matchbufline().

        {flags} is a String, which can contain these character flags:
        'b'     search Backward instead of forward
        'c'     accept a match at the Cursor position
        'e'     move to the End of the match
        'n'     do Not move the cursor
        'p'     return number of matching sub-Pattern (see below)
        's'     Set the ' mark at the previous location of the cursor
        'w'     Wrap around the end of the file
        'W'     don't Wrap around the end of the file
        'z'     start searching at the cursor column instead of Zero
        If neither 'w' or 'W' is given, the 'wrapscan' option applies.

        When the {stopline} argument is given then the search stops
		after searching this line.  This is useful to restrict the
		search to a range of lines.  Examples:
			let match = search('(', 'b', line("w0"))
			let end = search('END', '', line("w$"))

        If the {skip} expression is given it is evaluated with the
		cursor positioned on the start of a match.  If it evaluates to
		non-zero this match is skipped.  This can be used, for
		example, to skip a match in a comment or a string.
		{skip} can be a string, which is evaluated as an expression, a
		function reference or a lambda.
		When {skip} is omitted or empty, every match is accepted.
		When evaluating {skip} causes an error the search is aborted
		and -1 returned.
```

## examples

#### search for "highlight"

```
syn keyword words
	\ foo

highlight words cterm=inverse

let foo = search("highlight")

echo foo
```
Outputs `4` for line 4 and puts the cursor at the start of "highlight".
