## general info

https://en.wikipedia.org/wiki/ANSI_escape_code

## usage

#### escape character

In Bash and `printf` the escape sequence starts with either `\033` or `\e`.

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
