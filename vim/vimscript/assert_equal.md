```
assert_equal()
assert_equal({expected}, {actual} [, {msg}])
    When {expected} and {actual} are not equal an error message is
    added to v:errors and 1 is returned.  Otherwise zero is
    returned. assert-return
    The error is in the form "Expected {expected} but got
    {actual}".  When {msg} is present it is prefixed to that,
    along with the location of the assert when run from a script.

    There is no automatic conversion, the String "4" is different
    from the Number 4.  And the number 4 is different from the
    Float 4.0.  The value of 'ignorecase' is not used here, case
    always matters.
    Example:
            call assert_equal('foo', 'bar', 'baz')
    Will add the following to v:errors: 
            test.vim line 12: baz: Expected 'foo' but got 'bar'
```
