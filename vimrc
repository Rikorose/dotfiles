"0 vim:fdm=marker et fdl=2 ft=vim sts=2 sw=2 ts=2

" Configuration for vanilla (neo)vim, with no plugins

" Neovim-vim deltas {{{
if !has('nvim')
  " Default vaules (or removed) in Neovim (see :help vim-differences). Make sure
  " we're working with the same baseline here.

  " Basic auto indentation
  set autoindent
  " Automatically reload modified files
  set autoread
  " Don't scan included files for keyword completion (too slow)
  set complete-=i
  set complete-=t
  set complete+=k
  set completeopt=menu,preview
  " Display as much as possible as last line, instead of just showing @
  set display=lastline
  " Use modern encoding
  set encoding=utf-8
  " Default formatoptions in neovim: tcqj
  " t Wrap text using textwidth
  " c Wrap comments using textwidth, inserting comment leader automatically.
  " q Allow formatting of comments with "gq"
  set formatoptions=tcq
  if version >= 704
    " j Remove comment leader when joining lines (added in Vim 7.4)
    set formatoptions+=j
  endif
  " Default history store
  set history=10000
  " Highlight search results
  set hlsearch
  " Show incremental search matches
  set incsearch
  if has('langmap') && (v:version > 704 || v:version == 704 && has('patch502'))
    " Disable langmap for characters from a mapping (on by default in neovim)
    set langnoremap
  endif
  " The future is now!
  set nocompatible
  " Neovim default
  set sessionoptions-=options
  " Backspace should delete tabwidth of characters
  set smarttab
  " More tabs at once (match neovim default)
  set tabpagemax=50
  " Default tag store
  set tags="./tags;,tags"
  " On modern terminals
  set ttyfast
  " No longer exists in Neovim
  set ttymouse=xterm2
  " Makes filename tab completion more bash-like
  set wildmenu
 " Fvigator_no_mappings = 1zf plugin
  set rtp+=~/.fzf
  set rtp+=~/.config/vim/plugins/fzf
  let fzfplug=expand("~/.config/vim/plugins/fzf/plugin/fzf.vim")
  if filereadable(fzfplug)
    execute 'source '.fnameescape(fzfplug)
  endif
  set rtp+=~/.config/vim/plugins/fzf.vim
  let fzfvimplug=expand("~/.config/vim/plugins/fzf.vim/plugin/fzf.vim")
  if filereadable(fzfvimplug)
    execute 'source '.fnameescape(fzfvimplug)
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
  endif
  " black plugin
  set rtp+=~/.config/vim/plugins/black
  let blackplug=expand("~/.config/vim/plugins/black/plugin/black.vim")
  if filereadable(blackplug)
    execute 'source '.fnameescape(blackplug)
  endif
  " Tmux navigation
  set rtp+=~/.config/vim/plugins/vim-tmux-navigator
  let tmuxplug=expand("~/.config/vim/plugins/vim-tmux-navigator/plugin/tmux_navigator.vim")
  let g:tmux_navigator_no_mappings = 1
  let g:tmux_navigator_save_on_switch = 2
  let g:tmux_navigator_disable_when_zoomed = 1
  if filereadable(tmuxplug)
    execute 'source '.fnameescape(tmuxplug)
  endif
  " Save session i.e. for tmux-resurrect
  set rtp+=~/.config/vim/plugins/vim-obession
  let tmuxplug=expand("~/.config/vim/plugins/vim-obession/plugin/obession.vim")
endif
" }}}

" Base Configuration {?<{{

" Support mouse
set mouse=a

" Core Behavior {{{
" Read .vimrc from current dir, if present
set exrc

" Don't allow shell and write commands in exrc
set secure

" Enable loading plugin / indent settings based on filetype
filetype plugin indent on

" Don't redraw while executing macros, etc
set lazyredraw

" Wait just under a second before CursorHold is fired
set updatetime=750

" Mapping & keycode timeouts
set timeoutlen=600
set ttimeout
set ttimeoutlen=10
" }}}

" UI {{{
" Maintain indent when wrapping
if exists('+breakindent')
  set breakindent
endif

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Highlight textwidth column
set colorcolumn=+1

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

" Enable live substitution
if exists('&inccommand')
  set inccommand=split
endif

" Always show statusline
set laststatus=2

" Let same document scroll differently in separate panes
set noscrollbind

" Hide default mode text (i.e. INSERT below status line)
set noshowmode

" Use 5 characters for number well
set numberwidth=5

" Show line numbers
set number

" Disable visual bell
set noerrorbells
set visualbell t_vb=

" Show cursor position in bottom right
set ruler

" Keep lines in view at edges of screen
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Hide the intro screen, use [+] instead of [Modified], use [RO] instead
" of [readyonly], and don't give completion match messages
set shortmess+=Imrc

" Display incomplete commands
set showcmd

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Reasonable tab completion
set wildmode=full
" }}}

" File Handling {{{
" Automatically write files on :next, :make, etc
set autowriteall

" Save automatically all the time
augroup auto_save
  autocmd!
  " Frequently save automatically
  autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall
  " Check for file changes
  autocmd BufEnter,BufWinEnter,CursorHold,FocusGained * silent! checktime
augroup END

" Support mac files
set fileformats+=mac

" Hide buffers instead of closing them (useful for switching between files)
set hidden

" Don't use backup files, we have Git for that
set nobackup
set noswapfile
set nowritebackup

" Search within subfolders by default
set path+=**
" But ignore noise
set path-=.git,build,lib,node_modules,public,_site,third_party

" Ignore autogenerated files
set wildignore+=*.o,*.obj,*.pyc
" Ignore source control
set wildignore+=.git
" Ignore lib/ dirs since the contain compiled libraries typically
set wildignore+=build,lib,node_modules,public,_site,third_party
" Ignore images and fonts
set wildignore+=*.gif,*.jpg,*.jpeg,*.otf,*.png,*.svg,*.ttf
" Ignore case when completing
set wildignorecase

" Use the system clipboard
"set clipboard=unnamedplus
set clipboard=unnamed
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR> 
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

" Editing Behavior {{{
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

" Completion {{{
" Keyword completion brings in the dictionary if spell check is enabled
set complete+=kspell

" Only insert longest common text of matches & show menu when only one match
set completeopt=menuone,longest

" Make sure there's a default dictionary for completion
if filereadable('/usr/share/dict/words')
  set dictionary+=/usr/share/dict/words
endif

" Enable tab/enter if completion menu is open
" inoremap <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<Tab>")
" inoremap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")
" }}}

" Default formatoptions (as of neovim): tcqj
" Only break the line if wasn't longer than 88 chars when editing began
" and there is a blank somewhere in the line
set formatoptions+=lb
" Don't continue comments when pressing o/O
set formatoptions-=o
" Recognize numbered lists and wrap accordingly
set formatoptions+=n

" Show special indicators
set list
" Highlight trailing spaces
set listchars=trail:·,tab:»·
" Show wrap indicators
set listchars+=extends:»,precedes:«
" Show non-breaking spaces
set listchars+=nbsp:%

" Allow incrementing letters
set nrformats+=alpha

" Always assume decimal numbers
set nrformats-=octal

" Show matching brackets for half a second
set showmatch
set matchtime=5

" Wrap at 88 characters
set textwidth=88

" Make h/l move across beginning/end of line
set whichwrap+=hl

" Soft wrap, with indicator
set wrap
set showbreak=«
" }}}

" Colors & Syntax Highlighting {{{
" Enable syntax highlighting by default
syntax enable

" Only highlight first 500 chars for better performance
set synmaxcol=500
" }}}

" Searching {{{
" Match all results in a line by default (/g at end will undo this)
set gdefault

" Ignore case, except when using some uppercase
set ignorecase
set smartcase

" Clear search highlights with <C-L>
nnoremap <silent> <C-L> :nohlsearch<cr><C-L>

" Helper for visual search
function! s:VisualSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" */# in visual mode searches for selected text, similar to normal mode
vnoremap * :<C-u>call <SID>VisualSetSearch('/')<cr>/<C-R>=@/<cr><cr>
vnoremap # :<C-u>call <SID>VisualSetSearch('#')<cr>/<C-R>=@/<cr><cr>
" }}}

" Efficiency Shortcuts {{{
" Use space as leader
let mapleader=" "
let maplocalleader=" "

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

" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
set backspace=indent,eol,start
inoremap <C-BS> <C-w>

" Delete current word
noremap <C-w> daw

"" Quick copy/paste
vmap <C-c> "py
nmap <C-c> "pyiw
vmap <C-p> "pp
nmap <C-p> "pP
imap <C-p> <Esc>"ppa

" Move current line / visual line selection up or down.
" Taken from https://github.com/airblade/dotvim/
nnoremap <C-S-j> :m+<CR>==
nnoremap <C-S-k> :m-2<CR>==
vnoremap <C-S-j> :m'>+<CR>gv=gv
vnoremap <C-S-k> :m-2<CR>gv=gv

" CTRL-U for undo in insert mode
inoremap <C-U> <C-G>u<C-U>

" Never use ZZ, too dangerous
nnoremap ZZ <nop>

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Use | and _ to split windows (while preserving original behaviour of
" [count]bar and [count]_).
" Stolen from http://howivim.com/2016/andy-stewart/
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

" <leader>r starts a find a replace for word under cursor
nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>

" Go to next buffer
nnoremap <leader>n :bn<cr>

" Go to previous buffer
nnoremap <leader>p :bp<cr>

" Delete current buffer
nnoremap <leader>d :bd<cr>

" current buffer
nnoremap <leader><space> :e#<cr>

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>gf :<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Rg<cr>

" TMUX
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Change local directory to current file
nnoremap <leader>lcd :lcd %:p:h<cr>
" Go back to root
nnoremap <leader>cd :GitRootCD<cr>

" Quickly edit current buffer in a new tab (poor-man's maximize)
nnoremap <leader>te :tabedit %<cr>

" Quickly open tab
nnoremap <leader>tn :tabnew<cr>

" Close a tab
nnoremap <leader>tc :tabclose<cr>

" Filetype configuration {{{
augroup filetype_tweaks
  autocmd!
  " Not all files should wrap automatically
  autocmd BufNewFile,BufReadPost *.txt,*.md,*.json,*.conf,*.ini,*.pug,*py
    \ setlocal textwidth=0

  " Enable spell checking & linebreaking at words in some filetypes
  autocmd BufNewFile,BufReadPost *.txt,*.md,*.markdown,COMMIT_EDITMSG
    \ setlocal spell linebreak

  " Disable spell checking on unmodifiable files (what's the point?)
  autocmd BufReadPost * if !&modifiable | setlocal nospell | endif

  " Linting for shell scripts
  if executable('shellcheck')
    autocmd FileType sh setlocal makeprg=shellcheck\ -x\ -f\ gcc\ %
  endif

  " Linting for vimscript
  if executable('vint')
    autocmd FileType vim setlocal makeprg=vint\ --enable-neovim\ \-s\ %
  endif

augroup END
" }}}

" Netrw config {{{
" Disable annoying banner
let g:netrw_banner=0

" Open in same window
let g:netrw_browse_split=0

" Open splits to the right
let g:netrw_altv=1

" Tree view
let g:netrw_liststyle=3

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
" }}}

" Local Settings {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}
