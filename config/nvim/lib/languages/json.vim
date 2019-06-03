call coc#add_extension('coc-json')
let g:coc_filetypes += ['json']

augroup vimrc-languages-json
  autocmd!
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

function! MaybeSetJsonFiletype()
  try | call json_decode(join(getline(1, '$'), "\n")) | setfiletype json | catch | endtry
endfunction

augroup filetypedetect
  autocmd! BufRead,BufNewFile *.cfg call MaybeSetJsonFiletype()
augroup END
