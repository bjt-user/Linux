#### get the length of a string

```
vim9script

var my_string = "hello"

var my_length = len(my_string)

echo my_length
```

#### json string to dict (json_decode)

Transform a json string to a dict with `json_decode`:
```
vim9script

var ansible_doc_output = system('ansible-doc -j -l ansible.builtin')

var builtin_modules = json_decode(ansible_doc_output)
```
