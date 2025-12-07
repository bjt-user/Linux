## general info

```
:h executable
```

```
executable({expr})                                      executable()
    This function checks if an executable with the name {expr}
    exists.  {expr} must be the name of the program without any
    arguments.

    executable() uses the value of $PATH and/or the normal
    searchpath for programs.

    The result is a Number:
            1       exists
            0       does not exist
            -1      not implemented on this system
    exepath() can be used to get the full path of an executable.
```

It probably works crossplattform.

## examples

#### check if programs are installed

```
vim9script

if executable("cat")
	echo "cat exists"
else
	echo "There is not executable named cat."
endif

if executable("nonexistent")
	echo "nonexistent exists"
else
	echo "There is no executable named nonexistent."
endif
```
