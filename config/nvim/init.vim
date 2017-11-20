" vim:fdm=marker et fdl=2 ft=vim sts=2 sw=2 ts=2

" Automatically download vim-plug, if not present
if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo 'vim-plug not installed, downloading'
  !curl -fLo '~/.local/share/nvim/site/autoload/plug.vim' --create-dirs
    \ https://aw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'vim-plug downloaded, will install plugins once vim loads'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Read ~/.vimrc as well
if filereadable(expand($HOME.'/.vimrc'))
  source $HOME/.vimrc
endif


call plug#begin('~/.local/share/nvim/plugged')

" Syntax highlighting
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'

" Git plugin
Plug 'airblade/vim-gitgutter'

" Language plugin
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Syntax highlighting and language server
Plug 'reasonml-editor/vim-reason-plus'

" Async completion
Plug 'roxma/nvim-completion-manager'

" async code formatting
" :Neoformat <opt_formatter> for entire file
" :Neoformat! <filetype> for visual selection
Plug 'sbdchd/neoformat', { 'on': ['Neoformat'] }

" Use FZF for fuzzy finding if available (see config below)
if executable('fzf')
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
end

call plug#end()

" set termguicolors
" :colorscheme onedark

let g:solarized_termcolors=256
" Use for beamer: set background=light
set background=dark
colorscheme solarized

set number

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" nvim-completion-manager {{{
" Use fuzzy matching
let g:cm_matcher = {'case': 'smartcase', 'module': 'cm_matchers.fuzzy_matcher'}
" }}}

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {}

augroup LanguageClientConfig
  autocmd!

  " <leader>ld to go to definition
  autocmd FileType python nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " <leader>lf to autoformat document
  autocmd FileType python nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
  " <leader>lh for type info under cursor
  autocmd FileType python nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " <leader>lr to rename variable under cursor
  autocmd FileType python nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
  " <leader>lc to switch omnifunc to LanguageClient
  autocmd FileType python nnoremap <buffer> <leader>lc :setlocal omnifunc=LanguageClient#complete<cr>
  " <leader>ls to fuzzy find the symbols in the current document
  autocmd FileType python nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>

  " Use as omnifunc by default
  autocmd FileType python setlocal omnifunc=LanguageClient#complete
augroup END

" Python LSP configuration
if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
endif

" Neoformat {{{
" Use formatprg when available
let g:neoformat_try_formatprg = 1
" }}}

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
    \ call GitRootCD() | call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%', '?')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

  " Use fuzzy searching for K & Q, select items to go into quickfix
  nnoremap K :Rag! <C-R><C-W><cr>
  vnoremap K :<C-u>norm! gv"sy<cr>:silent! Rag! <C-R>s<cr>
  nnoremap Q :Rag!<SPACE>
end
" }}}
