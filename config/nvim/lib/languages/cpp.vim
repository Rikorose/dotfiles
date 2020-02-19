" let g:coc_filetypes += ['c', 'cpp']
" call coc#config('languageserver', {
" \ 'ccls': { 
" \   'command': 'ccls',
" \   'filetypes': ['c', 'cpp'],
" \   'rootpaterns': ['.ccls', 'compile_commands.json', '.vim/', '.git/', '.hg/'],
" \   'initializationOptions': { 'cacheDirectory': '/tmp/ccls' },
" \ },
" \})

au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif

augroup vimrc-language-python
  autocmd!
  autocmd FileType c,cpp set shiftwidth=2
  autocmd FileType c,cpp set foldmethod=syntax
augroup END
