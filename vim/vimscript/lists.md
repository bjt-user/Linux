## general info

```
:h list
```

```
:h list-func
```

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

#### minimum/maximum of a list

This will return the minimum value of a list:
```
min(my_list)
```
If it is a list of numbers, the lowest number will be returned.


It works for a list of strings as well:
```
vim9script

var names =
    [
        "Zorro",
        "Adalbert",
        "Hugo",
    ]

echo "min: " .. min(names)
echo "max: " .. max(names)
```
outputs:
```
min: Adalbert
max: Zorro
```

#### count number of occurences in a list

Count the number of times an element is in a list.
```
vim9script

var my_list = [
	1,
	10,
	1,
	5,
	1,
]

echo count(my_list, 1
```
outputs:
```
3
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
