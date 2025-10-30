## general info

#### about just

It is a simple command runner.

It is NOT a replacement of `make` as it does not resolve dependencies \
but it is a nicer command runner and you dont need to misuse `make` to \
execute project specific commands.

#### documentation

https://just.systems/man/en/introduction.html

#### advantages of just

- can be executed in subdirectories even if the `justfile` is at the root
of the project
- all targets are phony, so no need for `.PHONY`

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

#### initializing variables

```
EXECUTABLE := "my-program"
```

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

#### subsequent dependencies

You can have a recipe run after your recipe.

In this example `bar` will always run after `foo`:
```
foo: && bar
        echo "This is foo."

bar:
        echo "This is bar."
```

```
$ just foo
echo "This is foo."
This is foo.
echo "This is bar."
This is bar.
```

#### choose recipe

```
just --choose
```

#### doc comments

https://just.systems/man/en/documentation-comments.html#documentation-comments

Just place a comment above the recipe:
```
# this one will foo around
foo:
	echo 'foo'
```

The comment will be printed when doing a `just -l` or `--explain`:
```
$ just --explain foo
#### this one will foo around
echo 'foo'
foo
```

> The `[doc]` attribute can be used to set or suppress a recipe’s doc comment.

#### dryrun

Use `-n` or `--dry-run`.

#### builtin functions

https://just.systems/man/en/functions.html

example:
```
system-info:
	@echo "This is an {{arch()}} machine".
```

#### shebang recipes

For putting if conditions in your recipes you need \
shebang recipes.

https://just.systems/man/en/shebang-recipes.html

#### TOOD: script recipes

Probably one way to use another shell or `python`.

https://just.systems/man/en/script-recipes.html

#### timestamps

```
$ just --timestamp --timestamp-format "%Y-%m-%d_%H:%M:%S" foo
[2025-05-11_15:42:12] echo 'foo'
foo
[2025-05-11_15:42:12] sleep 1
[2025-05-11_15:42:13] echo 'bar'
bar
```

#### print justfile

Might be more convenient to type than `cat justfile`:
```
just --dump
```
(only 11 characters instead of 12)

## attributes

https://just.systems/man/en/attributes.html

#### working-directory

To execute the recipe in a different directory:
```
[working-directory("/tmp")]
touch_file:
	touch foo.txt
```

## troubleshooting

#### environment variables

https://just.systems/man/en/sharing-environment-variables-between-recipes.html?highlight=environment#sharing-environment-variables-between-recipes

> Each line of each recipe is executed by a fresh shell, so it is not possible to share environment variables between recipes.
