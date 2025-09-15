## usage

#### append to list

```
add(my_list, "hello")
```

#### defining lists in vim9script vs. legacy

This will not work in legacy:
```
vim9script

const my_list =
	[
	'Adam',
	'Eva',
	'Hugo'
	]

echo my_list
```

legacy wants it like this:
```
let my_list = ['Adam','Eva','Hugo']

echo my_list
```

## examples

#### defining an empty list

```
vim9script

var my_list = []

echo typename(my_list)
```
outputs:
```
list<any>
```

#### iterate through list

```
vim9script

var my_list = ['foo', 'bar']

for item in my_list
	echo item
endfor
```
