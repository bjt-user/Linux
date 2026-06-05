#### multiple conditions

```
if myvar == 1 && yourvar == 1
	echo "Foobar."
endif
```

```
if myvar == 1 || yourvar == 1
	echo "Foobar."
endif
```

#### elseif

```
vim9script

var foo = "foo"
var bar = "foo"

if foo == "foo"
	echo "FIRST"
elseif bar == "foo"
	echo "SECOND"
endif
```
outputs:
```
FIRST
```
