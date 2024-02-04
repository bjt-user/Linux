"put this in your .vimrc:
"let mapleader=","
nmap <Leader>c :call Comment_normal() <CR>
vmap <Leader>c :call Comment_visual() <CR>
"then you can comment/uncomment bash lines by hitting , then c
"it also works for multiple lines. type <3> <,> <c>

function Comment_normal ()
  "get the content of the current line:
  let curline=getline('.')
  "get the column position of the cursor:
  let curcol=col('.')
  "get the line number where the cursor is at:
  let curlineno=line('.')

  let firstpart=strpart(curline, 0, 1)

  normal 0

  if firstpart == "#"
    "typing "_x deletes one character in vim without putting it in register:
    normal "_x
  else
    execute "normal i#\<Esc>"
  endif
  call cursor(curlineno,curcol)
endfunction

function Comment_visual()
	" save the default register to a variable to not overwrite
	let saved_register = @@

	let curline=getline('.')

	let firstpart=strpart(curline, 0, 1)

	if firstpart != "#"
		s/^/#
	else
		normal! 0x
	endif

	let @@ = saved_register
endfunction
