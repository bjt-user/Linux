# investigate vims regex implementation

## general info

`:h pattern-overview`

TODO: test this:
```
/\%#    \%#     \%#     cursor position /zero-width
```

#### match comments

```
syntax match comment "#.*"
```

#### first non whitespace character

Match lines starting with `#` or that have 0-infinite whitespace in front:
```
syntax match commentline "^\s*#.*"
```
Comments will be recognized no matter how much whitespace is infront of the \
pound sign.

This regex seems to be compatible with basic `grep`.

According to regex101.com:\
> `*` matches the previous token between zero and unlimited times
