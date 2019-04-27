" Colorsheme {{{

  if (has("termguicolors"))
    set termguicolors
  endif
  let g:one_allow_italics = 1
  set background=dark
  " set background=light " Usefull for beamer presentation
  colorscheme one

" }}}

" configure behaviour of wildmenu when I press <Tab> in the Vim command prompt
set wildmode=full

" always show the sign column
set signcolumn=yes

" enable bell everywhere
set belloff=

" title {{{
set title
let &titlestring = '%F% (nvim)'
" }}}

set mouse=a
" <RightMouse> pops up a context menu
" <S-LeftMouse> extends a visual selection
set mousemodel=popup

" Buffers {{{

  set hidden

  " open diffs in vertical splits by default
  set diffopt+=vertical

  " buffer navigation {{{
    noremap <silent> <Tab> :bnext<CR>
    noremap <silent> <S-Tab> :bprev<CR>
    noremap <silent> gb :buffer #<CR>
  " }}}

  " Bbye with confirmation, or fancy buffer closer {{{
    function s:CloseBuffer(cmd) abort
      let l:cmd = a:cmd
      if &modified
        let l:answer = confirm("Save changes?", "&Yes\n&No\n&Cancel")
        if l:answer is# 1      " Yes
          write
        elseif l:answer is# 2  " No
          let l:cmd .= '!'
        else                   " Cancel/Other
          return
        endif
      endif
      execute l:cmd
    endfunction
  " }}}

  " closing buffers {{{
    nnoremap <silent> <BS> :<C-u>call <SID>CloseBuffer('bdelete')<CR>
    nnoremap <silent> <Del> :<C-u>quit <bar> call <SID>CloseBuffer('bdelete')<CR>
  " }}}

" }}}

" Windows {{{

  " window navigation {{{
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
  " }}}

  " switch to previous window
  noremap <C-\> <C-w>p

  " don't automatically make all windows the same size
  set noequalalways

  " splitting {{{
    noremap <silent> <leader>h :split<CR>
    noremap <silent> <leader>v :vsplit<CR>
  " }}}

" }}}

" Fuzzy Finding (FZF) {{{
if executable('fzf')
  nnoremap <silent> <F1> :Helptags<CR>
  nnoremap <silent> <leader>f :Files<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
endif
" }}}
