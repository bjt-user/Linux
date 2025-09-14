## general info

Write a custom omnifunc to get your own autocompletion.

#### documentation

```
:h complete-func
```

```
The function is called in two different ways:
- First the function is called to find the start of the text to be completed.
- Later the function is called to actually find the matches.
```

The function is called two times.

#### first call

```
On the first invocation the arguments are:
   a:findstart  1
   a:base	empty
```

#### return value (first call)

```
The function must return the column where the completion starts.
It must be a number between zero and the cursor column "col('.')".
This involves looking at the characters just before the cursor and
including those characters that could be part of the completed item.
The text between this column and the cursor column will be replaced with the matches.
If the returned value is larger than the cursor column, the cursor column is used.
```

#### second call

```
On the second invocation the arguments are:
   a:findstart  0
   a:base	the text with which matches should match; the text that was
		located in the first call (can be empty)
```

So you have to check if `findstart` is 1, then look at what is behind the cursor \
and return the number of columns that have to be replaced by a completion.

If the last strings are not what you want you can probably skip completion with -2:
```
Negative return values:
   -2	To cancel silently and stay in completion mode.
   -3	To cancel silently and leave completion mode.
   Another negative value: completion starts at the cursor column
```

#### return value (second call)

```
The function must return a List with the matching words.
These matches usually include the "a:base" text.
When there are no matches return an empty List.
Note that the cursor may have moved since the first invocation,
the text may have been changed.

In order to return more information than the matching words, return a Dict
that contains the List.
The Dict can have these items:
        words           The List of matching words (mandatory).
        refresh         A string to control re-invocation of the function
                        (optional).
                        The only value currently recognized is "always", the
                        effect is that the function is called whenever the
                        leading text is changed.
```

If an empty list is returned the following red warning appears under the \
status bar:
```
Pattern not found
```

## examples

#### completion for ansible builtin modules

```
vim9script

def MyOmniFunc(findstart: number, base: string): any
	# Define the dictionary
	var my_dict = {group: 'manage groups', user: 'manage users'}
	const pattern = 'ansible.builtin.'

	if findstart == 1
		var complete_start = searchpos(escape(pattern, '.'), 'bn', line('.'))[1]

		if complete_start == 0
			return -3
		endif

		if complete_start != (col('.') - strlen(pattern))
			return -3
		endif

		return complete_start - 1
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

Doesnt work if you already typed part of the module like `ansible.builtin.gr`.

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
