## general info

#### about just

It is a simple command runner.

It is NOT a replacement of `make` as it does not resolve dependencies \
but it is a nicer command runner and you dont need to misuse `make` to \
execute project specific commands.

#### documentation

https://just.systems/man/en/introduction.html

#### installation

```
sudo pacman -S just
```

## usage

#### justfile

```
just --init
```

This will create a file called `justfile`.

The syntax is simlar to `make`:
```
initial-setup:
	mkdir -pv settings container foo/bar
```

#### list recipes

```
$ just -l
Available recipes:
    initial-setup
```

#### default recipes

https://just.systems/man/en/the-default-recipe.html?highlight=default#the-default-recipe

#### dependencies

You can also use dependencies to run multiple recipes by default:

```
default: lint build test

build:
  echo Building…

test:
  echo Testing…

lint:
  echo Linting…
```

#### choose recipe

```
just --choose
```
