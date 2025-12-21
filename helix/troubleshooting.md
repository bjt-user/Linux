#### clang: implicit function definition errors

When opening vim source code clang shows errors of undefined functions.

Someone mentioned I shall generate `compile_commands.json`.

This generate a `compile_commands.json`:
```
bear -- make -j8
```
And then the errors were gone.
