#### using it inside vim

Add a connection:
```
:cs(cope) add .
```

help:
```
:cs help
```

Find definition:
```
:cs find g my_identifier
```

Find functions calling `my_function`:
```
:cs find c my_function
```

#### search for word under cursor

In ex mode (when writing something with `:`) ctrl + r, ctrl + w \
will copy the word under the cursor.

```
:cs f g <CTRL-R> <CTRL-W>
```
