"call this function with :call Snippet_for()
"tabcompletion works too

function Snippet_for()
  let l:snippet="n=5\<cr>
        \for ((i=0; i<$n; i++)); do\<cr>
        \echo $i\<cr>
        \done\<cr>"
  execute "normal i" . l:snippet . "\<Esc>"
endfunction
