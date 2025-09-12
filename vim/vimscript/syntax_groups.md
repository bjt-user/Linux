## nested syntax groups

Use the `contains` keyword.

For example if you want the group "comment" to be highlighted even though they are \
inside the group "block":
```
syntax region block start="{" end="}" skip="#.*" contains=comment fold
```

## contained keyword

```
contained                                               :syn-contained
When the "contained" argument is given, this item will not be recognized at
the top level, but only when it is mentioned in the "contains" field of
another match.
Example:
:syntax keyword Todo    TODO    contained
:syntax match   Comment "//.*"  contains=Todo
```
