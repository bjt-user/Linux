"(echos for debugging are commented out)
"using <c-u> before call eliminates the number you type before the command
"but you can still catch that number with v:count or v:count1
nmap <unique> <silent> <Leader>c :<c-u>call Commenter() <CR>

let s:firstrun="true"

"using abort for a function just means that it will stop when an error
"occurs (easier to read error messages)
function Commenter() abort
  let l:i = v:count1
  while l:i>0
    if s:firstrun=="true"
      "get the column position of the cursor:
      let s:startcol=col('.')
      "get the line number where the cursor is at:
      let s:startlineno=line('.')
    endif

    "echo "the column of the first run is " . s:startcol
    "echo "the line number of the first run is " . s:startlineno

    let l:curlineno=line('.')
    "echo "the current line is " . l:curlineno
    let l:curcol=col('.')
    "echo "the current col is " . l:curcol

    "echo "Is this the first run? " . s:firstrun
    "echo "What iteration of the command are we in? " . l:i
    "an additional echo is needed because the insert will eat the last line:
    "echo ""

    "get the content of the current line:
    let curline=getline('.')

    let firstchar=strpart(curline, 0, 1)

    let j=0
    while firstchar == " "
      let j=j+1
      let firstchar=strpart(curline, j, 1)
    endwhile

    let j=j+1

    "move j times from col 1 to the right:
    execute "normal " . j . "|"

    "echo "firstchar is " . firstchar

    if firstchar == "#"
      "typing "_x deletes one character in vim without putting it in register:
      "normal "_x
      execute "normal \"_x\<Esc>"
    else
      execute "normal i#\<Esc>"
    endif

    if l:i==1
      call cursor(s:startlineno,s:startcol)
      let s:firstrun="true"
    else
      execute "normal j"
      let s:firstrun="false"
    endif
    let l:i-=1
  endwhile
endfunction
