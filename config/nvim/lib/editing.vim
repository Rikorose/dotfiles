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

" Make h/l move across beginning/end of line
set whichwrap+=hl

" Wrapping {{{
  set nowrap
  set showbreak=«
  set colorcolumn=+1
" }}}

" Cursor and Scrolling {{{

  set number
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

" Use 5 characters for number well
set numberwidth=5

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

if version >= 704
  " Show git repo information (if available)
  let g:activeStatusLine="%{StatuslineTag()}»"
else
  let g:activeStatusLine=""
endif
" Relative path to file in current buffer
let g:activeStatusLine.="%<%f "
" Exclamation mark if not modifiable, + if modified
let g:activeStatusLine.="%{&readonly ? \"! \" : &modified ? '+ ' : ''}"
" Start left align, show filetype
let g:activeStatusLine.="%= %{&filetype == '' ? 'none' : &filetype} "
" Line/col/percent
let g:activeStatusLine.="%l:%2c "
function! StatuslineTag()
  if exists('b:git_dir')
    " Shitty unicode character w/o patched fonts
    return "‡".fugitive#head(7)
  else
    return fnamemodify(getwinvar(0, 'getcwd', getcwd()), ':t')
  endif
endfunction

let g:quickfixStatusLine="%t (%l of %L)"
let g:quickfixStatusLine.="%{exists('w:quickfix_title')? ' '.w:quickfix_title : ''}"
let g:quickfixStatusLine.="%=%-15(%l,%c%V%) %P"

" Default status line
let statusline=g:activeStatusLine

" Use different status line for active vs. inactive buffers
function! UpdateStatusLine(status)
  if &filetype=="qf"
    let &l:statusline=g:quickfixStatusLine
  elseif &filetype=="help" || &filetype=="netrw"
    let &l:statusline=&filetype
  elseif a:status
    let &l:statusline=g:activeStatusLine
  else
    " Just show filename & modified when inactive
    let &l:statusline='%f %{&modified ? "+" : ""}'
  endif
endfunction

augroup status_line
  autocmd!
  autocmd BufWinEnter,BufEnter,TabEnter,VimEnter,WinEnter * call UpdateStatusLine(1)
  autocmd BufLeave,TabLeave,WinLeave * call UpdateStatusLine(0)
augroup END

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

