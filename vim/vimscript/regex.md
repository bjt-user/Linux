# investigate vims regex implementation

#### first non whitespace character

To match comments starting with a `#` char this seems to work:
```
syntax match comment "^\s*#.*"
```
Comments will be recognized no matter how much whitespace is infront of the \
pound sign.

This regex seems to be compatible with basic `grep`.
