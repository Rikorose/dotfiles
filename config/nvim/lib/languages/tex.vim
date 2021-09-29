function! MyFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

augroup vimrc-language-tex
  autocmd!
  autocmd FileType tex setlocal formatoptions-=tc
  autocmd FileType tex setlocal spell spelllang=en_us
  " autocmd FileType tex setlocal formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
  autocmd FileType tex setlocal wrap
  autocmd FileType tex inoremap <F5> <esc>:CocCommand latex.Build<cr>a
  autocmd FileType tex nnoremap <F5> :CocCommand latex.Build<cr>
augroup END
