## general info

You will usually need `assert_exception` with a try/catch.

```
assert_fails()
assert_fails({cmd} [, {error} [, {msg} [, {lnum} [, {context}]]]])
        Run {cmd} and add an error message to v:errors if it does
        NOT produce an error or when {error} is not found in the
        error message.  Also see assert-return.
```

Does not seem to work if the command does not exist:
```
call assert_fails('foo')
```
This will create an error: "Not an editor command".

## bugs

This command seems to mess with the terminal in a bad way.
