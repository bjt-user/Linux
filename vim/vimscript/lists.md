## usage

#### append to list

```
add(my_list, "hello")
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
