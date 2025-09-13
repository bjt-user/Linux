## general info

Write a custom omnifunc to get your own autocompletion.

#### documentation

```
:h completefunc
```

The function is called two times.

```
On the first invocation the arguments are:
   a:findstart  1
   a:base	empty
```

```
On the second invocation the arguments are:
   a:findstart  0
   a:base	the text with which matches should match; the text that was
		located in the first call (can be empty)
```

So you have to check if `findstart` is 1, then look at what is behind the cursor \
and return the number of columns that have to be replaced by a completion.

## examples

#### broken example

It does some completion, but not the way you want to.
```
vim9script


def MyOmniFunc(findstart: number, base: string): any
    # Define the dictionary
    var my_dict = {group: 'manage groups', user: 'manage users'}

    if findstart == 1
        # see `:h compl-thesaurusfunc` for example
        #return searchpos('\<', 'bnW', line('.'))[1] - 1
		return col('.') - 12
	endif


	var matches = []
	for key in keys(my_dict)
		add(matches, {word: base .. key, menu: my_dict[key]})
	endfor
	return {words: matches}
enddef

# Set the custom omnifunction
setlocal completeopt=menu,menuone,noselect
setlocal omnifunc=MyOmniFunc
```
