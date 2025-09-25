#### strings

```
syntax region string start=+"+ end=+"+ skip=+\\"+
```

#### simple blocks

These blocks dont end when a closing paren is inside a `#` comment:
```
syntax region block start="{" end="}" skip="#.*"
```

#### overlapping groups

From `:h syn-region`.

> The search for the end pattern starts right after the start pattern.\
Offsets are not used for this.\
This implies that the match for the end pattern will never overlap with the start pattern.
