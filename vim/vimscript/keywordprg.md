## examples

#### using a custom command instead of an external program

Using a custom command and deciding what to do depending on the word \
under cursor:
```
vim9script

# increases vim startup time by 300-400ms
var ansible_keywords = json_decode(system('ansible-doc -j -t keyword -l'))

set keywordprg=:LookupAnsibleDoc

command -nargs=1 LookupAnsibleDoc {
	if has_key(ansible_keywords, "<args>")
		echo system('ansible-doc -t keyword <args>')
	else
		!ansible-doc <args>
	endif
}
```
