" call coc#add_extension('coc-git')
" call coc#config('git.gitlab.hosts', ['git5.cs.fau.de'])

" vim-signify {{{
  nmap <Leader>hn <Plug>(signify-next-hunk)
  nmap <Leader>hp <Plug>(signify-prev-hunk)
  nmap <Leader>Hn 9999<leader>hn
  nmap <Leader>Hp 9999<leader>hp
  let g:signify_vcs_list = ['git']
" }}}

" Resolving git merge conflicts {{{
  nnoremap <leader>gd :Gvdiff<CR>
  nnoremap gdh :diffget //2<CR>
  nnoremap gdl :diffget //3<CR>
  nnoremap gd1 :diffget //2<CR>
  nnoremap gd2 :diffget //2<CR>
  nnoremap gd3 :diffget //3<CR>
  nnoremap gdo :diffget <CR>
" }}}
