```
search({pattern} [, {flags} [, {stopline} [, {timeout} [, {skip}]]]])
                Search for regexp pattern {pattern}.  The search starts at the
                cursor position (you can use cursor() to set it).

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
