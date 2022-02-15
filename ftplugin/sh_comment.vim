"put this in your .vimrc:
"let mapleader=","

"TODO: it does not work if the line is indented

map <unique> <Leader>c :call Commenter() <CR>

function Commenter ()
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
