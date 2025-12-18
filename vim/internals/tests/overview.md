#### test_codestyle

Run this before doing a PR:
```
make test_codestyle
```

#### test_gui

Takes around 17 seconds.

`Test_quoteplus()` and `Test_windowid_variable()` failed.

And these tests also failed in `master`.

So it might make sense to skip these tests.

This did NOT work:
```
export TEST_SKIP_PAT=test_gui
```

This did also NOT work:
```
export TEST_SKIP_PAT=Test_quoteplus,Test_windowid_variable
```
