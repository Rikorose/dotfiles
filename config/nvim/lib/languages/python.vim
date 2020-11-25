augroup vimrc-language-python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal textwidth=88
  autocmd FileType python setlocal formatoptions+=ro
  autocmd FileType python setlocal formatoptions-=t
  autocmd FileType python nnoremap <buffer> <leader> lf :Black<CR>
augroup END

let g:python_highlight_all = 1
