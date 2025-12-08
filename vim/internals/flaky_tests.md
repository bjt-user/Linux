#### TEST_NO_RETRY

From `testdir/runtest.vim`:
```
" While working on a test you can make $TEST_NO_RETRY non-empty to not retry:
"     export TEST_NO_RETRY=yes
```
This works.

#### make tests nonflaky (weird behavior)

To make your test nonflaky so that it does not run multiple times \
when it failed, put this line directly in front of your assert:
```
let g:test_is_flaky = 0
call assert_equal('', my_var)
```
This does not always work.
