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
" }}}