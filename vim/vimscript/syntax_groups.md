## nested syntax groups

Use the `contains` keyword.

For example if you want the group "comment" to be highlighted even though they are \
inside the group "block":
```
syntax region block start="{" end="}" skip="#.*" contains=comment fold
```
