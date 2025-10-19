## general info

https://en.wikipedia.org/wiki/ANSI_escape_code

## usage

#### escape character

In `Bash` and `printf` the escape sequence starts with either `\033` or `\e`.

In `C` and `printf` it works the same way.

Then an opening square brackets follows before the rest of the code.

So:
```
\e[
```

#### back to normal white text

```
\e[0m
```

#### spaces

```
printf "\033[2C<- two spaces\n"
```
outputs:
```
  <- two spaces
```

#### red

```
printf "\e[31mfoobar\n"
```
