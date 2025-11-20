## examples

#### :h

This will put `:h ex-cmd-index` in under the status bar:
```
call feedkeys(":h ex-cmd-index")
```

#### insert foo and change to normal mode

```
vim9script

call feedkeys("ifoo\e")
```
Switch to insert mode (`i`), put the string `foo`.\
Then go to normal mode (`\e`).

`\e` is the escape key that switches back to normal mode.
