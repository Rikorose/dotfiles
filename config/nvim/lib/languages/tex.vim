call coc#add_extension('coc-texlab')
let g:coc_filetypes += ['tex']
call coc#config('latex', {
\ 'forwardSearch': {
\   'executable': 'zathura',
\   'args': ['--synctex-forward', '%l:1:%f', '%p'],
\ },
\})

augroup vimrc-language-tex
  autocmd!
  autocmd FileType tex let b:coc_pairs = [["$", "$"]]
augroup END

noremap <F5> :CocCommand latex.Build<CR>
