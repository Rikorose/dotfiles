" pop-up (completion) menu mappings {{{

  function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

" coc.nvim {{{
  " list of filetypes (that are added in language-specific scripts) for which
  " coc mappings are enabled
  let g:coc_filetypes = []

  function! IsCocEnabled()
    return index(g:coc_filetypes, &filetype) >= 0
  endfunction

  augroup vimrc-coc
    autocmd!
    autocmd FileType * if IsCocEnabled()
      \|let &l:formatexpr = "CocAction('formatSelected')"
      \|let &l:keywordprg = ":call CocAction('doHover')"
      \|endif
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    call coc#config('diagnostic', {
      \ 'checkCurrentLine': v:true,
      \ 'refreshOnInsertMode': v:true,
      \ 'signature.hideOnTextChange': v:true,
      \ 'coc.source.around.priority': 11,
      \ 'coc.source.file.priority': 10,
      \ 'coc.source.buffer.priority': 9,
      \ 'yank.priority': 8,
      \ })
  augroup end

  " mappings {{{
    let g:coc_snippet_next = '<Tab>'
    let g:coc_snippet_prev = '<S-Tab>'

    inoremap <silent><expr> <C-Space> coc#refresh()

    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Remap for rename current word
    nmap <leader>lr <Plug>(coc-rename)

    " Remap for format selected region
    vmap <leader>lsf <Plug>(coc-format-selected)
    nmap <leader>lsf <Plug>(coc-format-selected)

    " Use `:Format` for format current buffer
    command! -nargs=0 Format :call CocAction('format')
    nnoremap <leader>lf :call CocAction('format')<CR> <bar> :w<CR>

    " Use `:Fold` for fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " Show yank list
    nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>
  " }}}

  call coc#add_extension('coc-snippets')
  call coc#add_extension('coc-yank')
  call coc#add_extension('coc-pairs')
" }}}
