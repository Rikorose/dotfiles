call coc#add_extension('coc-python')
let g:coc_filetypes += ['python']
call coc#config('pyls.plugins.pycodestyle.ignore', ['E501', 'E203'])
call coc#config('coc.preferences.formatOnSaveFiletypes', ['python'])
call coc#config('python', {
\ 'autocomplete': { 
\   'showAdvancedMembers': v:false,
\   'addBrackets': v:true,
\ },
\ 'formatting': { 'provider': 'black' },
\ 'linting': {
\   'pylintEnabled': v:false,
\   'flake8Enabled': v:true,
\   'mypyEnagled': v:true,
\   'flake8Args': ['--ignore', 'E501', 'E203'],
\ },
\})

augroup vimrc-language-python
  autocmd!
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set foldmethod=indent
augroup END

let g:python_highlight_all = 1
