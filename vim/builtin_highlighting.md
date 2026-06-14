#### variables

This will show options for C highlighting:
```
:h ft-c-syntax
```
For example `c_no_curly_error` if you want compound literals inside \
parenthesis not to show as errors.

`c_space_errors` will highlight trailing whitespace as errors.\
And spaces before a tab.

> c_no_curly_error        don't highlight {}; inside [] and () as errors; \
                         ...except { and } in first column \
                        Default is to highlight them, otherwise you \
                        can't spot a missing ")".
