#### make tests nonflaky

To make your test nonflaky so that it does not run multiple times \
when it failed, put this line directly in front of your assert:
```
let g:test_is_flaky = 0
call assert_equal('', my_var)
```
