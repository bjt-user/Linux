"put this in your .vimrc:
"let mapleader=","

map <unique> <Leader>c :call Commenter() <CR>

function Commenter ()
  "get the content of the current line:
  let curline=getline('.')
  "get the column position of the cursor:
  let curcol=col('.')
  "get the line number where the cursor is at:
  let curlineno=line('.')

  let firstchar=strpart(curline, 0, 1)

  let i=0
  while firstchar == " "
    let i=i+1
    let firstchar=strpart(curline, i, 1)
  endwhile

  let i=i+1

  execute "normal " . i . "|"

  if firstchar == "#"
    "typing "_x deletes one character in vim without putting it in register:
    normal "_x
  else
    execute "normal i#\<Esc>"
  endif
  call cursor(curlineno,curcol)
endfunction
