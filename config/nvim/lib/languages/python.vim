augroup vimrc-language-python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal textwidth=100
  autocmd FileType python setlocal formatoptions+=ro
  autocmd FileType python setlocal formatoptions-=t
augroup END

let g:python_highlight_all = 1
