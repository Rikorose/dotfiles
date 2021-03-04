" <leader> is space
let mapleader = " "
let maplocalleader = " "

" Indentation {{{

" C-style indentation
set cindent

" Tabs are spaces
set expandtab

" 2 spaces, not tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Round up indents
set shiftround

" }}}

" Wait half a second before CursorHold is fired
set updatetime=500

" Mapping & keycode timeouts
set timeoutlen=600
set ttimeout
set ttimeoutlen=10

" Maintain indent when wrapping
if exists('+breakindent')
  set breakindent
endif

" Folds {{{ 

  " Auto-close folds below current foldlevel when cursor leaves
  set foldclose=all

  " Enable folds, using markers by default
  set foldenable
  set foldmethod=marker
  
  " Default to having all folds open
  set foldlevelstart=99
  
  " Limit folds when using indent or syntax
  set foldnestmax=5
  
  set foldopen+=jump

" }}}

" Kick the habit of using <C-c> instead of <C-[>, since <C-c> breaks
" nvim-completion-manager
inoremap <C-c> <C-[>:echom "Use C-[ instead!"<cr>

" Close quickfix & help with q, Escape, or Control-C
" Also, keep default <cr> binding
augroup easy_close
  autocmd!
  autocmd FileType help,qf nnoremap <buffer> q :q<cr>
  autocmd FileType help,qf nnoremap <buffer> <Esc> :q<cr>
  autocmd FileType help,qf nnoremap <buffer> <C-c> :q<cr>
  " Undo <cr> -> : shortcut
  autocmd FileType help,qf nnoremap <buffer> <cr> <cr>
augroup END

" Map jj and jk to <ESC> to leave insert mode quickly
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" Make j/k move screen visible lines, not file lines
nnoremap j gj
nnoremap k gk

" Also use Q for quiting
:command Q q

" Make h/l move across beginning/end of line
set whichwrap+=hl

" Wrapping {{{
  set nowrap
  set showbreak=«
  set textwidth=80
  set colorcolumn=+1
" }}}

" Cursor and Scrolling {{{

  set number
  set relativenumber
  set cursorline

  " remember cursor position
  augroup vimrc-editing-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g`\"" | endif
  augroup END

  " Let same document scroll differently in separate panes
  set noscrollbind

  " Keep lines in view at edges of screen
  set scrolloff=5
  set sidescrolloff=5
  set sidescroll=1

  " }}}

" Enable live substitution
if exists('&inccommand')
  set inccommand=split
endif

" Always show statusline
set laststatus=2

" Hide default mode text (i.e. INSERT below status line)
set noshowmode

" determine the number of lines and set numberwidth accordingly
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 2

" Hide the intro screen, use [+] instead of [Modified], use [RO] instead
" of [readyonly], and don't give completion match messages
set shortmess+=Imrc

" Display incomplete commands
set showcmd

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search {{{

  " ignore case if the pattern doesn't contain uppercase characters (use '\C'
  " anywhere in pattern to override these two settings)
  set ignorecase smartcase

  nnoremap \ :nohlsearch<CR>

  " Better german keyboard shortcuts
  nnoremap + :nohlsearch<CR>
  nnoremap - /

  let g:indexed_search_center = 1

  " <leader>r starts a find a replace for word under cursor
  nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>
  " or the selection
  vnoremap <leader>r "hy:%s/<C-r>h//g<Left><Left>

  " Search for the ... arguments separated with whitespace (if no '!'),
  " or with non-word characters (if '!' added to command).
  function! SearchMultiLine(bang, ...)
    if a:0 > 0
      let sep = (a:bang) ? '\_W\+' : '\_s\+'
      let @/ = join(a:000, sep)
    endif
  endfunction
  command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>
" }}}

" Formatting {{{

  " don't insert a comment after hitting 'o' or 'O' in the Normal mode
  augroup vimrc-editing-formatting
    autocmd!
    autocmd FileType * set formatoptions-=o
  augroup END

" }}}

" Invisible characters {{{
  set list
  " Highlight trailing spaces
  set listchars=trail:·,tab:»·
  " Show wrap indicators
  set listchars+=extends:»,precedes:«
  " Show non-breaking spaces
  set listchars+=nbsp:%

" }}}

" Status line {{{
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ N\ ':''}
set statusline+=%#Search#%{(mode()=='i')?'\ \ I\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ R\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ V\ ':''}
set statusline+=%#WildMenu#%{(mode()=='c')?'\ \ C\ ':''}
set statusline+=%#lCursor#%{(mode()=='t')?'\ \ T\ ':''}
set statusline+=%#TermCursor# " Color
set statusline+=\ %n\ 
set statusline+=%#Pmenu#
set statusline+=\%m
set statusline+=\%r
set statusline+=\ %f
set statusline+=%= " Right justified
set statusline+=\ %Y\ \|
set statusline+=\ %c:3l:%-2c\ 
set statusline+=%#TermCursor#
set statusline+=\ %2p%%\ 
" }}}

" Undo direcotry {{{
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile
" }}}

