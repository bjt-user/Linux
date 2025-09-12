#### strings

```
syntax region string start=+"+ end=+"+ skip=+\\"+
```

#### simple blocks

These blocks dont end when a closing paren is inside a `#` comment:
```
syntax region block start="{" end="}" skip="#.*"
```
