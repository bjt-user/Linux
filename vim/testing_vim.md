## general tests

`src/testdir/README.txt`

> 4) Use make test_<subject> to run a single test.

#### trying to test a single test

```
time make test_syntax
```

```
real	0m0.499s
user	0m0.426s
sys	0m0.063s
```

Exit Code 0, so it seemed to have worked.

## syntax tests

#### general info

Read `runtime/syntax/testdir/README.txt`.

This tells how to compare failed tests with the expected result.

#### run tests

```
cd runtime/syntax/testdir
make test
```

After that the dirs `done` and `failed` with screen dumps will be created.

Those dirs can be cleaned with
```
make clean
```
inside `runtime/syntax`.

#### viewing screendumps

The files in dumps (for example `runtime/syntax/testdir/dumps/sh_ksh93_generic_01.dump`) \
are not really human readable.

```
:call term_dumpload('awk_00.dump')
```

If you have the file opened in vim you can do:
```
:call term_dumpload(expand('%'))
```

#### rerecord tests

1. edit files in `input` dir (maybe add comments)
2. run `make clean;make test` to get the failures
3. carefully check that the screendumps in the `failed` dir are good
4. move the screendumps from the `failed` dir to the `dumps` dir
5. run `make clean;make test` and no failures should be visible

#### adding a new test

1. Create a source file in the language you want to test in the "input"
directory.
2. run `make clean;make test`

(Or you can run the tests for a filetype only by passing its name as another
target, e.g. "java", before "test"):
```
make java test
```
3. the new test will fail, check the screendump in `failed` dir
4. put the screendump from `failed` dir to `dumps` dir
5. run `make clean;make test` and it should succeed now
