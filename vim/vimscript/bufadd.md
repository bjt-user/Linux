## examples

#### create new buffer and add it to the list

```
vim9script

var bufnr = bufadd('foobar')

badd bufnr
```
Then the new buffer shows up for `:ls`.\
And you can go to it with `bn`.

#### create a new buffer with a name

You need to edit the buffer so that it is listed with `:ls`.
```
vim9script

var bufnr = bufadd('foobar')

echo bufnr

e bufnr
```
Maybe there are other ways so that is buffer is instantly listed without \\
editing.
