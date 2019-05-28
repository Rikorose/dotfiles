let g:coc_filetypes += ['markdown']

augroup vimrc-languages-markdown
  autocmd!
  autocmd FileType markdown call pencil#init()
augroup END
