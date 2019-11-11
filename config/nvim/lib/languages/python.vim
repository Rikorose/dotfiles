call coc#add_extension('coc-python')
let g:coc_filetypes += ['python']
call coc#config('python', {
\ 'jediEnabled': v:true,
\ 'autocomplete': { 
\   'showAdvancedMembers': v:false,
\   'addBrackets': v:true,
\ },
\ 'formatting': { 'provider': 'black' },
\ 'linting': {
\   'pylintEnabled': v:false,
\   'flake8Enabled': v:true,
\   'mypyEnagled': v:true,
\   'flake8Args': ['--ignore', 'E501, E203'],
\ },
\})

augroup vimrc-language-python
  autocmd!
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set foldmethod=indent
  autocmd FileType python set textwidth=88
  autocmd FileType python setlocal formatoptions+=ro
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

let g:python_highlight_all = 1
