Asserts are not doing anything...

This will output nothing...
```
vim9script

var my_list = []

assert_true(len(my_list) == 0)
assert_true(len(my_list) != 0)
assert_false(len(my_list) == 0)
assert_false(len(my_list) != 0)
```
