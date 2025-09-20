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
