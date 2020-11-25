function! MyFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

inoremap <F5> <esc>:TexlabBuild<cr>a
nnoremap <F5> :TexlabBuild<cr>


augroup vimrc-language-tex
  autocmd!
  autocmd FileType tex setlocal formatoptions-=tc
  " autocmd FileType tex setlocal formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
  autocmd FileType tex setlocal wrap
augroup END
