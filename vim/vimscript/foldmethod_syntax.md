#### fold regions

When defining a syntax group with `syntax region` you can just put the word \
`fold` at the end.\
Now when `foldmethod` is set to `syntax` that syntax group will be folded.
```
set foldmethod=syntax

syntax region block start="{" end="}" fold
```
