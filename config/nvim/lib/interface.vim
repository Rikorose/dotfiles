" Colorsheme {{{

" Latest Mosh release does still not support true colors
  function! s:is_mosh()
    let output = system("is-mosh -v")
    if v:shell_error
      return 0
    endif
    return !empty(l:output)
  endfunction

  function s:auto_termguicolors()
    if !(has("termguicolors"))
      return
    endif

    if (&term == 'xterm-256color' || &term == 'nvim') && !s:is_mosh()
      set termguicolors
    else
      set notermguicolors
    endif
  endfunction
  call s:auto_termguicolors()

  let g:one_allow_italics = 1
  colorscheme one
  function! UpdateColorsheme()
    silent let islight = system('rg -c "COLORSCHEME.*onelight" ~/.config/alacritty/alacritty.yml')
    if islight == 1
      set background=light
    else
      set background=dark
    endif
    if &background == "light"
      " Better contrast
      call one#highlight("Normal", "383838", "", "none")
    endif
  endfunction
  augroup colorsheme
    autocmd!
    autocmd VimEnter,BufEnter * call UpdateColorsheme()
  augroup END
" }}}

" configure behaviour of wildmenu when I press <Tab> in the Vim command prompt
set wildmode=full

" always show the sign column
set signcolumn=yes

" enable bell everywhere
set belloff=

" title {{{
  set title
  let &titlestring="%r\ [nvim]\ %f"

  function! GitProject()
    if exists('b:git_dir')
      let l:project=fnamemodify(fugitive#RemoteUrl(),":t:r")
      let l:branch=fugitive#head(7)
      return "[".l:project."/".l:branch."] "
    else
      return ""
    endif
  endfunction

  function! UpdateTitle()
    " Get the git project and branch only on VimEnter/BufEnter
    let l:gitproject=GitProject()
    let &titlestring="%r\ [nvim]\ ".l:gitproject."%f"
  endfunction

  augroup title
    autocmd!
    autocmd VimEnter,BufEnter * call UpdateTitle()
  augroup END
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
    noremap <Leader>n :bnext<CR>
    noremap <Leader>p :bprev<CR>
    nnoremap <Leader>d :bdelete<CR>
    nnoremap <Leader><Leader> <C-^>
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
  if executable('rg')
    nnoremap <silent> <leader>g :Rg<CR>
  elseif executable('ag')
    nnoremap <silent> <leader>g :Ag<CR>
  endif
  nnoremap <silent> <leader>t :Tags<CR>
  nnoremap <silent> <leader>. :History:<CR>
endif
" }}}
