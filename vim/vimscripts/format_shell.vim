" this does not seem to change the cursor position
" and leaves no output on the console
" put it in ${HOME}/.vim/after/syntax/sh.vim

nmap <F9> :call Format() <CR>

function Format ()
        :w
        silent !shfmt -w %
        :redraw!
endfunction
