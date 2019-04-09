" vim:fdm=marker et fdl=2 ft=vim sts=2 sw=2 ts=2

" Automatically download vim-plug, if not present
if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo 'vim-plug not installed, downloading'
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'vim-plug downloaded, will install plugins once vim loads'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Read ~/.vimrc as well
if filereadable(expand($HOME.'/.vimrc'))
  source $HOME/.vimrc
endif

call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'rakr/vim-one'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']
Plug 'nathanaelkane/vim-indent-guides'

" Git integration
" Run Git commands from within Vim
" :Gstatus show `git status` in preview window
" - <C-N>/<C-P> next/prev file
" - - add/reset file under cursor
" - ca :Gcommit --amend
" - cc :Gcommit
" - D :Gdiff
" - p :Git add --patch (reset on staged files)
" - q close status
" - r reload status
" :Gcommit for committing
" :Gblame run blame on current file
" - <cr> open commit
" - o/O open commit in split/tab
" - - reblame commit
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Language plugin
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Use FZF for fuzzy finding if available (see config below)
if executable('fzf')
  Plug exepath('fzf')
  Plug 'junegunn/fzf.vim'
end

" Latex plugin
let g:tex_flavor = "latex"
Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-pdf',
  \   '-shell-escape',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \}

" Grammar plugin for latex
Plug 'rhysd/vim-grammarous'

" Auto close brackets etc.
Plug 'cohama/lexima.vim'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
let g:one_allow_italics = 1
set background=dark
" set background=light " Usefull for beamer presentation
colorscheme one

set number

filetype plugin on
autocmd FileType *
  \ if &omnifunc == "" |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

" COC language server client

" Update time for CursorHold & CursorHoldI
set updatetime=500

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Fuzzy Finding (FZF) {{{
if executable('fzf')
  " <C-p> to search files
  " Open in split via control-x / control-v
  " Select/Deselect all via alt-a / alt-d
  nnoremap <silent> <C-p> :call fzf#vim#files('', fzf#vim#with_preview())<cr>

  " <C-t> to search in the current git directory
  nnoremap <silent> <C-t> :call fzf#vim#gitfiles('', fzf#vim#with_preview())<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU & v:oldfiles
  nnoremap <silent> <M-S-p> :History<cr>

  " Fuzzy insert mode completion for lines
  imap <c-x><c-l> <plug>(fzf-complete-line)

  " Use fuzzy completion relative filepaths across directory with <c-x><c-j>
  imap <expr> <c-x><c-j> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

  " Better command history with <leader>:
  nnoremap <leader>. :History:<CR>

  " Better search history with <leader>/
  nnoremap <leader>_ :History/<CR>

  " Fuzzy search help <leader>?
  nnoremap <leader>? :Helptags<CR>

  " Search from git root via :Rag (Root Ag)
  " :Rag  - hidden preview enabled with "?" key
  " :Rag! - fullscreen and preview window above
  command! -bang -nargs=* Rag
    \ call functions#GitRootCD() | call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%', '?')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

  " Use fuzzy searching for K & Q, select items to go into quickfix
  nnoremap K :Rag! <C-R><C-W><cr>
  vnoremap K :<C-u>norm! gv"sy<cr>:silent! Rag! <C-R>s<cr>
  nnoremap Q :Rag!<SPACE>
end
" }}}
"
" vim-signify
nmap <Leader>hn <Plug>(signify-next-hunk)
nmap <Leader>hp <Plug>(signify-prev-hunk)
nmap <Leader>Hn 9999<leader>hn
nmap <Leader>Hp 9999<leader>hp
let g:signify_vcs_list = ['git']

" Latex shortcuts
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '}', 'at': '\\begin{.*\%#', 'input': '}<CR>\end{'})

" Configure grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help': 0, 'markdown': 0, 'tex': 0,
            \ }

nmap <Leader>gs :GrammarousCheck<CR>
nmap <Leader>gre <Plug>(grammarous-reset)
nmap <Leader>gi <Plug>(grammarous-move-to-info-window)
nmap <Leader>go <Plug>(grammarous-open-info-window)
nmap <Leader>gf <Plug>(grammarous-fixit)
nmap <Leader>gc <Plug>(grammarous-close-info-window)
nmap <Leader>gr <Plug>(grammarous-remove-error)
nmap <Leader>gn <Plug>(grammarous-move-to-next-error)
nmap <Leader>gp <Plug>(grammarous-move-to-previous-error)

" Indent Guides {{{
" Default guides to on everywhere
let g:indent_guides_enable_on_vim_startup=1

" Don't turn on mapping for toggling guides
let g:indent_guides_default_mapping=0

" Don't use their colors, depending on the colorscheme to define
let g:indent_guides_auto_colors=0

" Wait until we've nested a little before showing
let g:indent_guides_start_level=3

" Skinny guides
let g:indent_guides_guide_size=1
" }}}
