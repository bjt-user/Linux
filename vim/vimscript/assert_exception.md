## examples

#### basic example

```
try
  call feedkeys("ifoo\<ESC>:bx\<CR>", "x")
catch
  call assert_exception('E32:')
endtry
```
