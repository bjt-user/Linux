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

In `runtime/syntax/testdir/failed` do:
```
vim --clean -S sh_02_01.dump
```
