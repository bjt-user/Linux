# investigate vims regex implementation

#### first non whitespace character

To match comments starting with a `#` char this seems to work:
```
syntax match comment "^\s*#.*"
```
Comments will be recognized no matter how much whitespace is infront of the \
pound sign.

This regex seems to be compatible with basic `grep`.

According to regex101.com:\
> `*` matches the previous token between zero and unlimited times

This doesn't match trailing comments though.
