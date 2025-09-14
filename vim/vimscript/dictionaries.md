## general info

`:h dict`

```
dict Dict Dictionaries Dictionary
A Dictionary is an associative array: Each entry has a key and a value.  The
entry can be located with the key.  The entries are stored without a specific
ordering.
```

```
Dictionary creation
                                                E720 E721 E722 E723
A Dictionary is created with a comma-separated sequence of entries in curly
braces.  Each entry has a key and a value, separated by a colon.
Each key can only appear once.
Examples:
        :let mydict = {'one': 1, 'two': 2, 'three': 3}
        :let emptydict = {}
                                                        E713 E716 E717
A key is always a String.  You can use a Number, it will be converted to a
String automatically.  Thus the String '4' and the number 4 will find the same
entry.  Note that the String '04' and the Number 04 are different, since the
Number will be converted to the String '4', leading zeros are dropped.  The
empty string can also be used as a key.

In Vim9 script a literal key can be used if it consists only of alphanumeric
characters, underscore and dash, see vim9-literal-dict.
```

```
Accessing entries

The normal way to access an entry is by putting the key in square brackets:
        :let mydict = {'one': 1, 'two': 2, 'three': 3}
        :let val = mydict["one"]
        :let mydict["four"] = 4
        :let val = mydict.one
        :let mydict.four = 4

You can add new entries to an existing Dictionary this way, unlike Lists.
```

## examples

#### simple dictionary

```
vim9script

var my_dict = {Joe: 44}

# appending to dict
my_dict["Adam"] = 55

echo my_dict
echo typename(my_dict)
```
outputs:
```
{'Adam': 55, 'Joe': 44}
dict<number>
```
